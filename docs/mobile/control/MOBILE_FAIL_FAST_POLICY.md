---
type: control-policy
scope: mobile
status: canonical
phase: phase-d
---

# Mobile FAIL-FAST Policy

Mobile is governed by strict FAIL-FAST semantics.

## Rules

- Any mobile guard failure immediately blocks CI
- No warnings are allowed
- No partial PASS is allowed
- No manual override is permitted

## Execution Model

CI executes exactly one mobile entry point:

scripts/ci/mobile.sh

If it fails:
- build is blocked
- release is blocked
- discussion is out of scope

## Rationale

Mobile is a frozen product surface.
Any deviation is a defect, not a discussion.

