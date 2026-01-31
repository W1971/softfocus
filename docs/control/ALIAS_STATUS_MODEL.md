---
type: governance-model
scope: alias-status
mutability: restricted
---

# Alias Status Model

This document defines valid alias statuses
and how they affect pipeline evaluation.

---

## Statuses

### READY
- Alias may execute
- Counted in `generate-status`
- Required for CORE aliases

### DESIGN_ONLY
- Alias is visible
- Non-executable
- Used for specification and planning

### LOCKED
- Alias is visible
- Execution forbidden
- Used during freezes or incident response

### FAIL
- Alias execution failed
- Blocks pipeline if alias is CORE

---

## Aggregation Rules

- If any CORE alias is FAIL → overall status = FAIL
- `v2-design-check` must be READY
- OPTIONAL aliases do not affect overall status
- EXPERIMENTAL aliases are excluded from aggregation
