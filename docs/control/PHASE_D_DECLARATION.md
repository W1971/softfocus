---
type: governance-declaration
scope: project
phase: phase-d
mode: maintenance
mutability: frozen
---

# SoftFocus — Phase D Declaration (Maintenance Mode)

## Status

Phase D is hereby **formally declared**.

SoftFocus has completed all planned product definition,
governance, and execution phases required for v1.

The project now enters **Maintenance Mode**.

---

## Meaning of Phase D

Phase D signifies:

- product meaning is frozen
- analytical logic is frozen
- execution surfaces are frozen
- governance rules are immutable

SoftFocus is no longer under active development.
It is operated as a **stable analytical asset**.

---

## Allowed Changes (Strict)

The following are allowed **only if they do not alter meaning**:

- dependency updates
- security fixes
- infrastructure maintenance
- copy fixes that preserve semantics
- CI stability improvements

All allowed changes must:
- preserve existing behavior
- pass all canonical CI gates
- avoid introducing new surfaces or logic

---

## Forbidden Changes

The following are explicitly forbidden:

- new analytical axes
- new calculators or assessments
- changes to scoring or interpretation
- UX or UI redesigns
- content expansion affecting meaning
- monetization model changes

Any such change requires:
- a new project version
- a new governance phase
- explicit re-opening declaration

---

## Governance Authority

This declaration overrides:
- roadmaps
- drafts
- design discussions
- experimental artifacts

Only documents marked as **canonical** remain authoritative.

---

## Effective Date

This declaration is effective immediately
upon merge into the main governance branch.

