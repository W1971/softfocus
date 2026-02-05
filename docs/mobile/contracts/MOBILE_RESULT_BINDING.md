---
type: product-binding
scope: mobile
status: active
phase: phase-d
mutability: frozen
---

# Mobile Result Screen — Binding Contract

## Runtime
- Entry: app/index.tsx
- Framework: Expo
- Screens: 1
- Navigation: forbidden

## Text Source of Truth
- docs/mobile/canonical/RESULT_TEXT_CANON.md

## Design Authority
- docs/mobile/canonical/FINAL_MOBILE_SPEC.md

## Rules
- Code must reflect canonical text exactly
- Any text change requires:
  1) Canon update
  2) Bundle update
  3) Single atomic commit

Mobile is a terminal statement.
