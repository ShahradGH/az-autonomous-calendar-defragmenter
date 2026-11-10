# Operational Runbook: Workplace Engineering: Autonomous Calendar De-fragmentation via Microsoft Graph v2.x (L2 / L3 Triage)

## 1. Scope & Ownership
- **Accountable Owner**: Director of Workplace Technology & Principal Engineering Manager
- **Primary Evaluator**: `src/Test-CalendarEventDefragEligibility.ps1`
- **Telemetry Source**: `diagnostics/Telemetry-Queries.kql`

## 2. Triage Procedure When Veto Gate Trips
1. Inspect the structured refusal object emitted by `src/Test-CalendarEventDefragEligibility.ps1` and correlate the timestamp in Azure Monitor Log Analytics.
2. Do not bypass or disable the pre-flight policy gate without cryptographic dual-signature approval from the Director of Workplace Technology & Principal Engineering Manager.
3. Verify remediation locally by running `Invoke-Pester -Path ./tests/Boundary-Verification.Tests.ps1 -Output Detailed`.
