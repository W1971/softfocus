---
type: runtime-shape
scope: mobile
status: canonical
phase: phase-d
mutability: frozen
boundary: non-clinical
last_verified_utc: 2026-02-04T00:00Z
---

# Minimal Runtime Shape
**SoftFocus Mobile — Final Structural Contract**

This document defines the only permissible structural shape
of the SoftFocus mobile runtime.

It exists to eliminate interpretation, expansion,
and framework-driven drift.

This contract is design-only and authoritative.

---

## 1) Purpose of the Runtime

The mobile runtime exists to perform exactly one action:

- render a single analytical statement
- terminate interaction

No lifecycle beyond this action is permitted.

---

## 2) Absolute File Count Target

A compliant final runtime is expected to contain:

- **10–30 files total**
- including configuration, entry points, and build glue

Any runtime exceeding this range
is presumed non-compliant
unless explicitly justified by platform requirements.

---

## 3) Canonical Directory Shape

The final runtime MUST converge to the following shape:

All other directories are forbidden.

\---

\## 4) Screen Model (Singular)

Only ONE screen is allowed:

\- \`index.tsx\`

Rules:

\- renders static text only

\- no navigation

\- no routing logic

\- no props-driven branching

\- no conditional UI

If more than one screen exists,

the runtime violates this contract.

\---

\## 5) Component Policy

Reusable components are NOT allowed.

There must be:

\- no \`components/\` directory

\- no shared UI primitives

\- no theming systems

\- no abstraction layers

Inlining is preferred.

Duplication is acceptable.

Abstraction is forbidden.

\---

\## 6) Styling Policy

Styling must be:

\- inline or single-file

\- static

\- non-expressive

Forbidden:

\- design systems

\- style helpers

\- tokens

\- themes

\- animations

\- transitions

If styling logic becomes reusable,

it violates this contract.

\---

\## 7) Logic & State Policy

The runtime must not include:

\- application state

\- navigation state

\- async UI logic

\- user data

\- persistence

\- effects or subscriptions

Allowed logic:

\- render text

\- respect system font scaling

Anything else is excess.

\---

\## 8) Dependency Policy

Dependencies must be reduced to:

\- Expo core

\- React

\- React Native

Optional:

\- TypeScript tooling

\- platform-required shims

Any dependency that exists

to improve developer experience,

UX, or flexibility

must be removed.

\---

\## 9) Configuration Policy

Configuration files must:

\- exist only if required by tooling

\- contain no product logic

\- contain no feature toggles

Configuration is infrastructural only.

\---

\## 10) Deletion Principle

Deletion is not refactoring.

Deletion is the primary implementation action.

The correct implementation path is:

1\. delete directories

2\. delete files

3\. collapse structure

4\. inline remaining logic

If deletion feels risky,

the runtime is still too complex.

\---

\## 11) Compliance Test

The runtime is compliant if:

\- it can be understood in under 60 seconds

\- there is no question “where does this go?”

\- nothing suggests future expansion

\- nothing feels reusable

If the codebase feels “clean” or “well-architected”,

the contract has been violated.

\---

\## Final Statement

SoftFocus Mobile is not an application.

It is a minimal executable artifact

that exists to state one truth

and then end.

Any structure that survives beyond this purpose

must not exist.

