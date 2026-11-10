# ADR-001: Workplace Engineering: Autonomous Calendar De-fragmentation via Microsoft Graph v2.x

## Status
Accepted

## Service Owner & Sign-Off Authority
Director of Workplace Technology & Principal Engineering Manager

## Dominant Artefact
Calendar Schedule Packing Simulation Engine & Teams Negotiation Bot

## Decision & Refusal Boundary
All production state mutations must pass deterministic pre-flight policy evaluation in `src/Test-CalendarEventDefragEligibility.ps1` and satisfy the 16-test Pester verification contract in `tests/Boundary-Verification.Tests.ps1` before execution.
