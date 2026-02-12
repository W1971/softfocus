---
type: execution-plan
scope: mobile-runtime-deletion
status: canonical
phase: phase-d
mutability: frozen
boundary: non-clinical
last_verified_utc: 2026-02-04T00:00Z
---

# Deletion Execution Plan
**SoftFocus Mobile — Convergence to Minimal Runtime**

This plan defines the only allowed implementation approach
to converge the mobile codebase to the Final Minimal Runtime Shape.

It is a deletion-first plan.
Refactoring is not the primary tool.

This plan enforces:

- docs/mobile/canonical/MOBILE_DESIGN_ETHOS.md
- docs/mobile/canonical/FINAL_MOBILE_SPEC.md
- docs/mobile/contracts/MOBILE_RUNTIME_TO_PRODUCT_BINDING.md
- docs/mobile/control/MOBILE_CODE_FREEZE_MAP.md
- docs/mobile/contracts/MINIMAL_RUNTIME_SHAPE.md

---

## 1) Non-Negotiable Principle

Implementation is allowed only as convergence.

Convergence method:
- delete first
- inline second
- shrink last

If a decision creates a new abstraction,
a new directory, or a new reusable component,
it is invalid.

---

## 2) Execution Order (Mandatory)

### Phase A — Remove Forbidden Product Structures (Immediate)
Delete all FORBIDDEN surfaces that express:
- tabs
- exploration
- modal flows
- reusable UI infrastructure
- decorative UX helpers

Rule:
If the file appears in the Freeze Map as FORBIDDEN,
it is deleted without discussion.

Expected outcome:
- navigation concepts disappear from codebase

---

### Phase B — Collapse to Single Screen
Ensure the runtime resolves to one screen:

- `softfocus-mobile/app/index.tsx`

Rules:
- this file renders the statement screen only
- no conditional UI branching
- no navigation logic
- no interactions
- no links
- no buttons
- no gestures

Expected outcome:
- the app can launch and show the statement screen
- nothing else exists

---

### Phase C — Shrink Entry Wrapper to Near-Zero
Reduce `softfocus-mobile/app/_layout.tsx` to minimal boot glue.

Rules:
- no routes
- no stacks
- no tabs
- no modal handling
- no visual framing

If the wrapper cannot be reduced to near-zero,
it becomes FORBIDDEN and must be eliminated or replaced.

Expected outcome:
- boot is invisible

---

### Phase D — Remove UI Libraries and Component Systems
Delete any directories or utilities that create a UI system,
including (non-exhaustive):

- `components/`
- `ui/`
- `themed*`
- icons
- animations
- haptics
- parallax / scroll effects

Expected outcome:
- no reusable UI infrastructure remains
- only a single-screen render surface exists

---

### Phase E — Dependency Reduction
Remove all dependencies that are not required for:
- Expo runtime
- React / React Native
- build tooling required by the platform

Rules:
- no UX libraries
- no animation libraries
- no component libraries
- no navigation packages beyond what Expo strictly requires
- no “future readiness” dependencies

Expected outcome:
- dependency graph becomes minimal

---

### Phase F — Structural Flattening
Converge directory structure to the Minimal Runtime Shape contract:

- remove unused folders
- remove unused assets
- remove unused config fragments
- remove demo files

Expected outcome:
- the codebase becomes small enough to audit by sight

---

## 3) Stop Conditions (Hard)

Stop deletion when ALL conditions are true:

1. The app launches to a single statement screen.
2. There are no interactive elements.
3. There is no navigation concept anywhere in code.
4. File count is within the target range (10–30 total).
5. The runtime can be understood in under 60 seconds.

If any condition is false,
deletion continues.

---

## 4) Forbidden Implementation Behaviors

The following are forbidden during convergence:

- “refactor first”
- “clean architecture”
- “make it reusable”
- “create a component library”
- “introduce navigation for future”
- “improve UX”
- “add just one more screen”

All such actions are product expansion.

---

## 5) Verification Checklist (Minimal)

The following checks must be satisfied after each deletion phase:

- build passes
- app launches
- statement is visible immediately
- no taps are required
- no UI suggests continuation

No additional verification layers are required.

---

## 6) Audit Record (Design-Level)

After convergence:

- Freeze Map is updated if needed (rules only, not enumeration)
- V2 DESIGN_ONLY bundle is regenerated
- The resulting runtime is considered compliant if it matches:
  - binding contract
  - minimal runtime shape

---

## Final Statement

Deletion is the implementation.

The final product is achieved
not by building,
but by removing
everything that competes with the statement.

