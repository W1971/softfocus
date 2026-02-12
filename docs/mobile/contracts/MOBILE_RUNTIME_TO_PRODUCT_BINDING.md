---
type: runtime-product-binding
scope: mobile
status: canonical
phase: phase-d
mutability: frozen
boundary: non-clinical
last_verified_utc: 2026-02-04T00:00Z
---

# Mobile Runtime → Product Binding
**Canonical Contract**

This document binds the mobile runtime implementation
to the final product meaning defined in:

- docs/mobile/canonical/MOBILE_DESIGN_ETHOS.md
- docs/mobile/canonical/FINAL_MOBILE_SPEC.md

This contract is authoritative.
Implementation convenience is irrelevant.

---

## 1. Binding Principle

Mobile runtime exists solely to render
a single analytical statement and terminate interaction.

The runtime must not:
- express intent
- guide behavior
- encourage continuation
- expose structure

If runtime structure becomes visible to the user,
the binding is violated.

---

## 2. Allowed Runtime Responsibilities

The mobile runtime MAY:

- render a single screen
- display static text
- respect system typography scaling
- respect system light/dark preference (neutral only)
- terminate immediately without side effects

Nothing else is required.

---

## 3. Forbidden Runtime Concepts (Hard Ban)

The following concepts are permanently forbidden,
regardless of technical availability:

- navigation stacks
- tabs
- modals
- drawers
- gestures as signals
- swipe affordances
- animations or transitions
- loading states
- placeholders or skeletons
- onboarding flows
- state machines
- routing logic
- conditional UI branching
- personalization or user context

If a concept exists only because the framework provides it,
it must still be removed.

---

## 4. Expo / React Native Boilerplate Rejection

Default Expo templates are NOT compliant.

The following MUST NOT exist in the codebase:

- tab navigation
- example screens (explore, index, modal)
- haptics
- parallax or scroll effects
- themed wrappers
- icon systems
- placeholder components
- demo utilities

Any remaining boilerplate must justify
its existence by direct contribution
to the final product meaning.

---

## 5. Component Allowlist (Exhaustive)

Only the following component categories are allowed:

- a single root screen component
- a single text-rendering component
- a minimal view container
- platform-required entry points

Any additional component requires
explicit contract amendment.

---

## 6. File System Constraints

The mobile app MUST conform to:

- one entry screen
- flat structure
- no feature directories
- no UI libraries
- no shared UI components

If a file name implies interaction,
navigation, or exploration,
it violates this contract.

---

## 7. Styling Constraints

Styling must be:

- static
- non-expressive
- neutral
- unanimated

Forbidden:
- gradients
- shadows
- rounded UI metaphors
- cards
- color-based meaning
- emphasis effects

Typography must serve legibility only.

---

## 8. State & Logic Constraints

The runtime must not contain:

- user state
- session state
- navigation state
- async UI logic
- timers
- lifecycle-driven UX

The only permissible logic is:
render → display → exit.

---

## 9. Error Handling

Error states must not be visible.

If a runtime error occurs,
the correct behavior is silent failure.

No retry.
No messaging.
No fallback UI.

---

## 10. Compliance Rule

Any implementation that violates this binding:

- is non-compliant
- blocks progression
- must be removed

This contract overrides:
- framework conventions
- developer preference
- UI best practices

---

## Final Statement

Mobile runtime is not an application.

It is a delivery mechanism
for a single, final statement.

Anything that survives beyond that purpose
must be removed.
