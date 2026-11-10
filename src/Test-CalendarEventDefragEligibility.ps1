# Test-CalendarEventDefragEligibility.ps1
[CmdletBinding()]
param(
    [Parameter(Mandatory)] [PSCustomObject]$CalendarEvent,
    [Parameter()] [string]$InternalTenantDomain = 'contoso-sovereign.onmicrosoft.com'
)

$ErrorActionPreference = 'Stop'

# 1. Hard Refusal: Never touch External Client/Partner meetings
$externalAttendees = @($CalendarEvent.AttendeeEmails | Where-Object {
    $_ -notmatch "@$([regex]::Escape($InternalTenantDomain))$"
})
if ($externalAttendees.Count -gt 0) {
    return [PSCustomObject]@{
        EventId    = $CalendarEvent.EventId
        Subject    = $CalendarEvent.Subject
        Action     = 'LOCK_EXTERNAL_CLIENT_MEETING'
        Movable    = $false
        Reason     = 'Contains external domain attendees; strictly immovable.'
    }
}

# 2. Hard Refusal: Never move large meetings (>= 5 attendees) or High-Importance gates
if ($CalendarEvent.AttendeeEmails.Count -ge 5 -or $CalendarEvent.Importance -eq 'high') {
    return [PSCustomObject]@{
        EventId    = $CalendarEvent.EventId
        Subject    = $CalendarEvent.Subject
        Action     = 'LOCK_HIGH_ATTENDANCE_OR_EXECUTIVE_GATE'
        Movable    = $false
        Reason     = 'Meeting has >=5 attendees or High Importance flag.'
    }
}

# 3. Flag internal 30m meeting bisecting a >=3h afternoon focus corridor
if ($CalendarEvent.DurationMinutes -le 45 -and $CalendarEvent.BisectsAfternoonFocusWindow) {
    return [PSCustomObject]@{
        EventId          = $CalendarEvent.EventId
        Subject          = $CalendarEvent.Subject
        Action           = 'STAGE_MORNING_CLUSTER_NEGOTIATION_CARD'
        Movable          = $true
        ProposedSlotStart = '10:30:00'
    }
}

return [PSCustomObject]@{
    EventId    = $CalendarEvent.EventId
    Subject    = $CalendarEvent.Subject
    Action     = 'RETAIN_ALREADY_CONSOLIDATED'
    Movable    = $false
}
