# SoftFocus Alias System — Specification v1.0

## Purpose

`alias_softfocus` is a declarative control layer for the project.
It abstracts real scripts into stable roles (aliases) that can be tested,
classified, archived, and managed over long project lifetimes.

Scripts may change. Aliases must remain stable.

---

## Core Principles

1. Aliases are not executable
2. Aliases are not imported by code
3. Aliases represent roles, not files
4. One alias may map to multiple scripts
5. Any cleanup, archive, or deletion decision is made via alias
6. Tests classify aliases, not individual files

---

## Alias Lifecycle Model

scripts  
→ test run  
→ artifacts (logs, states)  
→ classification  
→ alias status  
→ long-term governance

---

## Alias Schema

### Alias Object

| Field | Description |
|------|-------------|
| alias | Stable role name |
| scope | scripts / tests / mixed |
| purpose | Why the alias exists |
| status | ACTIVE / READY / LOW_CONFIDENCE / DEPRECATED / ARCHIVED |
| risk_level | LOW / MEDIUM / HIGH |
| classification | Derived from test results |
| scripts | Bound files or globs |
| scenarios | Validating scenarios |
| notes | Architectural notes |

---

## Classification Object

classification:
- last_run: PASS / WARN / FAIL
- derived_state: READY / LOW / FAIL
- validated_by: TS-*

Classification is always derived, never manual.

---

## Scenario → Classification Rules

- Any FAIL → FAIL
- WARN without FAIL → LOW_CONFIDENCE
- All PASS → READY
- Manual override → DEPRECATED

---

## Architectural Invariants

- Tests validate behavior, not implementation
- Scripts may move or be archived freely
- Alias identity must remain stable
- Knowledge is preserved via alias status

---

Code changes are temporary.  
Aliases are permanent.
