---
type: governance-contract
scope: status-aggregation
mutability: restricted
---

# generate-status Contract

`generate-status` is a CI-oriented aggregation tool.

---

## Required Environment

The following variables must be present:

- RUN_ID (required)
- CI (optional)

If RUN_ID is missing, execution must fail.

---

## Invocation Rules

- In CI: invoked directly
- Locally: invoked via alias-softfocus or with explicit RUN_ID

Direct local invocation without RUN_ID is forbidden by design.
