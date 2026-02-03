---
type: control
scope: lifecycle
status: locked
phase: phase-d
last_verified_utc: 2026-02-02T14:10Z
---

# Phase D Lock & Maintenance Mode

## Declaration

SoftFocus has entered **Phase D — LOCKED / MAINTENANCE MODE**.

From this point forward:

- Product meaning is frozen
- No new executable stages may be introduced
- No analytical axes may be added
- No behavioral or recommendation logic is allowed

---

## Executable Surface (Authoritative)

The **only executable CORE alias** in Phase D is:

- `bundle`

All other lifecycle gates are **design-level only**.

---

## Design-Level Gates

The following gates remain part of the product model
but are **non-executable**:

- stage-1 (visual)
- stage-2 (semantic)
- stage-3 (interaction)

They are enforced by:
- documentation freeze
- audit artefacts
- governance policy

---

## Maintenance Semantics

Allowed changes:
- documentation clarification
- operational fixes
- audit artefact updates
- bundle regeneration
- dependency alignment required by platform vendors
  (e.g. Expo SDK upgrades without semantic impact)


Forbidden changes:
- new CI stages
- new executable aliases
- logic expansion

This document is authoritative.
