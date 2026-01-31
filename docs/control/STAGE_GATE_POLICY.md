---
type: governance-policy
scope: stage-gates
---

Each development stage is protected by an executable gate.

If a stage audit FAILS:
- the next stage scripts MUST NOT run
- CI MUST block progression
- no manual override exists

alias-softfocus is the single enforcement entry point.
