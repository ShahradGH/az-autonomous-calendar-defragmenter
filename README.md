# Workplace Engineering: Autonomous Calendar De-fragmentation via Microsoft Graph v2.x

[![Pester Verification](https://img.shields.io/badge/pester-16%2F16%20passing-brightgreen)](tests/CalendarDefragmenter.Tests.ps1)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Architecture Deep-Dive](https://img.shields.io/badge/blog-alerasoul.net-0a1128)](https://alerasoul.net/autonomous-workplace-calendar-defragmenter/)

> **Primary Governance Artefact:** Calendar Schedule Packing Simulation Engine & Teams Negotiation Bot  
> **Accountable Service Owner:** Director of Workplace Technology & Principal Engineering Manager  
> **Full Architectural Deep-Dive:** [https://alerasoul.net/autonomous-workplace-calendar-defragmenter/](https://alerasoul.net/autonomous-workplace-calendar-defragmenter/)

---

## Repository Layout (9 Files)

```text
├── .gitignore
├── LICENSE
├── README.md
├── docs/PRIVACY-BOUNDARY-SPEC.md
├── fixtures/calendar-fragmentation-sample.json
├── permissions/graph-least-privilege-scopes.json
├── queries/Graph-Calendar-Throttle.kql
├── src/Test-CalendarEventDefragEligibility.ps1
└── tests/CalendarDefragmenter.Tests.ps1
```

## Quickstart & Offline Verification

```powershell
# 1. Execute the primary PowerShell 7 evaluator
pwsh -NoProfile -File ./src/Test-CalendarEventDefragEligibility.ps1

# 2. Run the 16-test Pester verification contract
Invoke-Pester -Path ./tests/CalendarDefragmenter.Tests.ps1 -Output Detailed
```

## License

Released under the [MIT License](LICENSE). Authored by **Shahrad Alerasoul** ([alerasoul.net](https://alerasoul.net)).
