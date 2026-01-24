---
type: design-governance
boundary: non-clinical
scope: ui-and-experience
mutability: restricted (v1.x frozen)
---

# SoftFocus — Design Governance Rules

## Purpose

This document defines non-negotiable
design and experience constraints
for SoftFocus interfaces.

It governs **what is allowed to appear**,
not how it is implemented.

---

## Rule 1 — Visual Minimalism Is Mandatory

Each screen must answer one question only.

If a screen:
- answers multiple questions,
- offers multiple paths,
- or creates visual competition,

it violates design governance.

---

## Rule 2 — No Decorative UI

Every visible element must:

- carry interpretive meaning, or
- reduce cognitive effort.

Pure decoration is forbidden.

Beauty emerges from restraint,
not embellishment.

---

## Rule 3 — Hidden Technology

No interface element may expose:

- algorithms,
- calculations,
- scores as technical artifacts,
- system internals.

Technology must feel absent.

---

## Rule 4 — Zero Configuration

Users must not be asked to:

- set preferences,
- choose modes,
- adjust sensitivity,
- customize behavior.

Choice is a cost.

---

## Rule 5 — Calm Over Engagement

SoftFocus must never:

- push urgency,
- encourage repeated use,
- gamify progress,
- celebrate outcomes.

The interface should feel complete,
not demanding.

---

## Rule 6 — Intuitive Completion

After receiving a result,
the user should feel:

- informed,
- finished,
- unpressured to continue.

Any feeling of “what should I do next?”
indicates a violation.

---

## Anti-Pattern List (Explicitly Forbidden)

- onboarding flows
- tooltips explaining the product
- progress bars
- streaks or reminders
- motivational language
- emotional amplification

---

## Enforcement

Any UI change must be reviewed against this document.

If a design choice cannot be defended
as reducing cognitive effort,
it must not ship.
