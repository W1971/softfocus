# Alias Status Model

This document defines how alias statuses influence system readiness.

## Status Levels (ordered)

1. READY
2. LOW_CONFIDENCE
3. DESIGN_ONLY
4. FAIL

## Interpretation

- READY: alias may execute and block release if failing
- LOW_CONFIDENCE: alias executes but degrades system readiness
- DESIGN_ONLY: alias MUST NOT execute and MUST NOT degrade readiness
- FAIL: alias blocks CI and release

## System Readiness Rule

System readiness equals the lowest status among all active aliases,
excluding aliases explicitly marked as DESIGN_ONLY.

DESIGN_ONLY aliases:
- are visible in status output
- are excluded from readiness calculation
- MUST be guarded by CI gates

