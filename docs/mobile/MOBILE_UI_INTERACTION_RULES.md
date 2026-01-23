---
type: design-governance
boundary: non-clinical
scope: mobile-ui
mutability: frozen (v1.x)
---

# SoftFocus — Mobile UI & Interaction Rules

## Purpose

This document governs how SoftFocus
appears and behaves on mobile devices.

It enforces clarity through restraint.

---

## Rule 1 — Visual Silence

Mobile UI must feel visually quiet.

- limited color palette
- large negative space
- no decorative elements

If an element draws attention to itself,
it must be removed.

---

## Rule 2 — Text as Primary Medium

Text is the dominant interface element.

Icons, charts, or visuals
may only appear if they reduce reading effort.

Visualization for emphasis is forbidden.

---

## Rule 3 — No Micro-Interactions

Animations, transitions, and effects:

- must be minimal,
- must not signal progress,
- must not reward interaction.

Nothing should feel “responsive” for its own sake.

---

## Rule 4 — Tap Economy

Each screen should require:
- zero or one tap.

Scrolling is acceptable.
Tapping to proceed is discouraged.

---

## Rule 5 — Neutral Tone Only

Language must be:

- analytical,
- calm,
- non-judgmental.

No emotional amplification.
No reassurance.
No encouragement.

---

## Rule 6 — Exit Is Success

The app must never resist exit.

No “Are you sure?”  
No “Come back later”.

Leaving the app is a valid outcome.

---

## Anti-Patterns (Explicit)

- cards with shadows
- gamified progress
- animated charts
- colorful alerts
- success/failure metaphors

---

## Enforcement

If a UI element makes the app
feel like a product asking for attention,
it must be removed.
