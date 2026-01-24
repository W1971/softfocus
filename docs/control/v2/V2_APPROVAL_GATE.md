# V2 Approval Gate

Purpose: Control transition from DESIGN_ONLY to IMPLEMENTABLE

---

## Current State

V2 is in DESIGN_ONLY mode.

This gate is **CLOSED**.

---

## What This Gate Controls

When CLOSED:
- Any implementation language is forbidden
- Any runtime discussion fails CI
- v2 is design theory only

When OPEN:
- v2 may enter technical planning
- frontend/backend exploration allowed
- no production deployment yet

---

## Approval Requirements (ALL REQUIRED)

1. Explicit governance decision
2. Updated risk assessment
3. Clear user boundary definition
4. Separate v2 release track
5. CI gate switched from BLOCK to ALLOW

---

## Explicit Non-Goals

Opening this gate does NOT mean:
- shipping v2
- exposing v2 to users
- replacing v1

It only permits **implementation discussion**.

---

## Audit Note

Any attempt to bypass this gate
is considered a governance breach.

