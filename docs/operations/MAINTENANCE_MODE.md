---
type: lifecycle-mode
status: active
phase: phase-d
mutability: frozen
---

# SoftFocus — Maintenance Mode (Phase D)

## Declaration

SoftFocus is operating in **Maintenance Mode (Phase D)**.

This mode is final for v1.x.

---

## What Maintenance Mode Means

- product logic is frozen
- analytical models are locked
- mobile surface is DONE
- audits are final
- governance rules are stable

No new meaning may be introduced.

---

## What Is Allowed

- dependency updates
- security fixes
- operational fixes
- documentation clarification (non-active only)

All changes must preserve behavior.

---

## What Is Forbidden

- new features
- UX changes
- new analytical axes
- monetization UI
- experimentation

Any such change requires a new phase declaration.

---

## Authority

CI is the single source of truth.

Manual overrides are forbidden.

---

## Exit From Maintenance Mode

Leaving Maintenance Mode requires:
- new RFC
- new phase declaration
- new version line (v2.x)

