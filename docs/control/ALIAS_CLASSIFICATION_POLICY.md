---
type: governance-policy
scope: alias-classification
mutability: restricted
---

# Alias Classification and Status Policy

This document defines how aliases are classified
and how their status affects execution and CI behavior.

---

## Alias Classes

### CORE
- Must have status READY
- CI fails otherwise
- Local execution is blocked unless status is READY

### OPTIONAL
- LOW_CONFIDENCE status is allowed
- CI emits warning only
- Local execution allowed with FORCE=1

### EXPERIMENTAL
- Status is informational only
- Never blocks CI
- Execution always requires FORCE=1

---

## UNKNOWN Status Handling

If an alias status cannot be resolved:

- CORE → treated as FAIL
- OPTIONAL → treated as LOW_CONFIDENCE
- EXPERIMENTAL → allowed but logged

---

## Enforcement

Alias class is authoritative.
No alias may change class without governance approval.
