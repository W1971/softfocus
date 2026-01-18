# Backend Plan v1.1 — Status Automation and Alias Gating

## Goal
Move from manual alias status to automatically derived status
based on execution and test artifacts.

---

## Status Auto-Generation

### Inputs
- tests/runs/*/run.jsonl
- CI smoke-tests
- alias execution exit codes

### Derived States
- READY
- LOW_CONFIDENCE
- FAIL

### Rules
- FAIL if any test reports failure
- LOW_CONFIDENCE if only partial coverage exists
- READY only if all required checks pass

Status files are written to:
alias_softfocus/status/<alias>.status

---

## Alias Gating

### Local Execution
- alias-softfocus run <cmd> refuses to run if status != READY
- override possible only with FORCE=1

### CI
- CI fails if:
  - any alias required by pipeline is not READY
  - docs smoke-test fails

---

## v1.1 Milestones

1. status generator script
2. status enforcement in alias-softfocus
3. CI integration
4. documentation update

---

## Non-Goals
- No business logic
- No UI logic
- No manual status overrides
