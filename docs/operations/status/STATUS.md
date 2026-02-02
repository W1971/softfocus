---
type: status
scope: ci
status: canonical
phase: phase-d
---

# SoftFocus — CI Status

## Interpretation

- **READY** — all governance, mobile, and build checks passed
- **FAIL** — at least one mandatory check failed

CI is the **single source of truth**
for operational readiness.

---

## Current Model

CI executes in strict order:

1. Backend gates
2. Frontend gates
3. Mobile governance (FAIL-FAST)
4. Frontend build
5. Post-build guards

If any step fails:
- build is blocked
- release is blocked
- discussion is out of scope

---

## Public Signal

The CI badge reflects the current system state:

- Green → READY
- Red → FAIL

No manual override exists.

