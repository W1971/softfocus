---
type: control
scope: mobile-code-freeze
status: canonical
phase: phase-d
mutability: frozen
boundary: non-clinical
last_verified_utc: 2026-02-04T00:00Z
---

# Mobile Code Freeze Map
**SoftFocus Mobile — Runtime Compliance Control**

This document defines the canonical allow/deny map
for the mobile runtime codebase.

It enforces the binding defined in:

- docs/mobile/canonical/MOBILE_DESIGN_ETHOS.md
- docs/mobile/canonical/FINAL_MOBILE_SPEC.md
- docs/mobile/contracts/MOBILE_RUNTIME_TO_PRODUCT_BINDING.md

Any file marked FORBIDDEN must be removed.
Any file marked LEGACY must not be used by production flows.
Only ALLOWED files may remain in the minimal final build.

This map is authoritative.

---

## 1) Status Legend

- ALLOWED: permitted in the final minimal mobile runtime
- LEGACY: transitional / template artifacts; must not be referenced by final screens
- FORBIDDEN: violates product meaning; must be removed

---

## 2) Freeze Scope (Current Snapshot)

This map covers the following paths (as provided):

- softfocus-mobile/app/**
- softfocus-mobile/components/**

Other paths are out of scope until explicitly inventoried.

---

## 3) Canonical Target Structure (Final)

The final mobile runtime must converge to:

- one entry point
- one statement screen
- zero optional UX features
- no navigation concepts exposed

Any additional structure requires explicit governance approval.

---

## 4) File Map — softfocus-mobile/app/**

### FORBIDDEN (must be removed)
These paths express navigation, exploration, or multi-surface product intent.

- softfocus-mobile/app/(tabs)/_layout.tsx
- softfocus-mobile/app/(tabs)/explore.tsx
- softfocus-mobile/app/(tabs)/index.tsx
- softfocus-mobile/app/modal.tsx

Rationale:
Tabs, explore screens, and modal surfaces violate:
- Single-Screen Result App semantics
- “Just works without learning”
- zero-interaction product definition

### LEGACY (transitional only)
- softfocus-mobile/app/_layout.tsx

Rule:
This file may exist only as a minimal technical entry wrapper,
and must not introduce navigation, headers, routes, or modal stacks.
If it becomes non-minimal, it becomes FORBIDDEN.

---

## 5) File Map — softfocus-mobile/components/**

### FORBIDDEN (must be removed)
The following components imply interaction, effects, haptics, theming systems,
or decorative UI infrastructure.

- softfocus-mobile/components/external-link.tsx
- softfocus-mobile/components/haptic-tab.tsx
- softfocus-mobile/components/hello-wave.tsx
- softfocus-mobile/components/parallax-scroll-view.tsx
- softfocus-mobile/components/themed-text.tsx
- softfocus-mobile/components/themed-view.tsx
- softfocus-mobile/components/ui/collapsible.tsx
- softfocus-mobile/components/ui/icon-symbol.ios.tsx
- softfocus-mobile/components/ui/icon-symbol.tsx

Rationale:
All listed components are boilerplate or interaction affordances.
They violate the runtime-product binding (no navigation concepts,
no gestures, no delight, no expressive UI systems).

### ALLOWED (conditional)
None of the current components are explicitly required by the final product.
If a minimal text component is desired, it must be created explicitly
and listed here by name.

---

## 6) Enforcement Rules

1. No FORBIDDEN file may be imported anywhere.
2. No LEGACY file may define product behavior or user-visible structure.
3. Only ALLOWED files may remain in the final minimal build.
4. Removal is preferred over refactor.
5. If a file is not needed for rendering the statement screen, it must not exist.

---

## 7) Exit Criteria for Step 3

Step 3 is complete when:

- all FORBIDDEN files are deleted
- LEGACY usage is reduced to a minimal entry wrapper
- a single statement screen exists as the only surface
- no navigation concepts remain in code or UI

---

## 8) Next Required Step

After this freeze map is accepted:

- create a minimal single-screen implementation plan (design-only)
- then perform the deletion and converge runtime to the final structure


---

## 9) Rule-Based Freeze Classification (Authoritative)

The following rules apply to the ENTIRE mobile codebase,
regardless of file count.

These rules are exhaustive and override intuition.

---

### 9.1 FORBIDDEN by Pattern (Global)

Any file is FORBIDDEN if it matches one or more of the following:

#### By Path
- contains `/tabs/`
- contains `/navigation/`
- contains `/routes/`
- contains `/modal`
- contains `/explore`
- contains `/ui/`
- contains `/components/`
- contains `/icons/`
- contains `/animations/`
- contains `/gestures/`
- contains `/haptics/`

#### By Filename
- includes `tab`
- includes `stack`
- includes `router`
- includes `navigation`
- includes `modal`
- includes `drawer`
- includes `carousel`
- includes `parallax`
- includes `scroll`
- includes `themed`
- includes `icon`
- includes `button`
- includes `input`
- includes `card`

#### By Responsibility
- visual effects
- interaction affordances
- navigation logic
- theming systems
- reusable UI libraries
- UX helpers

Any such file MUST be deleted.

---

### 9.2 LEGACY by Role (Transitional Only)

Files are LEGACY if they exist only because the framework requires them
but do not define product meaning.

Examples:
- root layout wrappers
- framework bootstrap files
- config glue

Rules:
- must not render UI
- must not introduce navigation
- must not include styling decisions
- must be reducible to near-zero logic

LEGACY files are allowed temporarily but must converge to minimal form.

---

### 9.3 ALLOWED by Exception (Explicit Only)

ALLOWED files are ONLY those that satisfy ALL conditions:

- required to boot the app
- required to render the single statement screen
- contain no interaction logic
- contain no navigation concepts
- contain no visual effects
- serve only text rendering or layout containment

If a file is not explicitly required for the single statement screen,
it is NOT allowed.

---

## 10) Enforcement at Scale

For large codebases (900+ files):

- rules override enumeration
- deletion is preferred over refactor
- absence is preferred over cleanliness
- the final codebase should shrink drastically

A compliant final runtime is expected to contain
**tens of files, not hundreds**.

---

## 11) Canonical Outcome

A correct implementation results in:

- massive file deletion
- flat directory structure
- one screen
- no navigation
- no UX surface

If the codebase still feels “like an app”,
the freeze has failed.

