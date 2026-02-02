---
type: control
scope: alias-status
status: active
last_verified_utc: 2026-02-02T14:15Z
---

# Alias Status Model

This document defines valid alias statuses
and their execution semantics.

---

## READY

- Alias is executable
- May be invoked by CI
- May affect readiness

---

## DESIGN_ONLY

- Alias is **non-executable**
- Exists for:
  - architectural clarity
  - lifecycle modeling
  - audit traceability
- Must NOT reference scripts
- Must NOT be invoked by CI

DESIGN_ONLY aliases MAY affect readiness
only via declared freeze or policy.

---

## LOCKED

- Alias exists but execution is forbidden
- Used during incidents or freezes

---

## FAIL

- Alias execution failed
- Blocks readiness if alias is CORE

---

## Phase D Rule

In Phase D:
- Only READY aliases may be executed
- DESIGN_ONLY aliases are satisfied by lock declaration
