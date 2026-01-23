# Project Documentation Hierarchy — SoftFocus

## Purpose

This document defines the hierarchy of documentation within the SoftFocus project.

It clarifies:
- which documents are canonical
- which are supporting
- which are historical or reference-only

The hierarchy exists to prevent semantic drift
and to keep the project linear and auditable.

---

## Level 0 — Single Entry Point

**docs/overview.md**

- The only mandatory entry point
- Defines what SoftFocus is
- Describes product scope, governance model, and lifecycle
- All other documents must be compatible with this file

If a document conflicts with `overview.md`,
it is considered invalid.

---

## Level 1 — Governance and Control

These documents define rules, constraints, and enforcement.

Directories:
- docs/governance/
- docs/control/

Characteristics:
- normative
- mandatory
- enforced by CI where applicable

Changes here are rare and explicit.

---

## Level 2 — Product and Execution

These documents define what the product is
and how it is executed.

Directories:
- docs/product/
- docs/frontend/

Characteristics:
- product contracts
- execution boundaries
- platform-specific policies (e.g. mobile)

They must comply with Level 1
and align with Level 0.

---

## Level 3 — Business, Roadmaps, Releases

These documents describe direction and planning,
but do not define product behavior.

Directories:
- docs/business/
- docs/roadmap/
- docs/release/
- docs/releases/

Characteristics:
- informative
- directional
- non-binding

They must not introduce new product logic.

---

## Level 4 — Internal, Reference, Archive

These documents are retained for context,
history, or internal coordination.

Directories:
- docs/internal/
- docs/reference/
- archive/

Characteristics:
- optional
- non-canonical
- safe to ignore for product understanding

---

## Interpretation Rules

- Higher levels override lower levels
- Canonical documents are few by design
- If a document can be removed without breaking the product,
  it is not canonical

---

## Change Policy

This hierarchy is stable as of v1.5.0.

Changes require:
- explicit rationale
- governance approval
- version update


---

## Naming note: docs/frontend vs /frontend

SoftFocus uses two layers that share the name "frontend":

- docs/frontend/ — specification and governance documentation
  (contracts, policies, mobile rules, schemas)
- /frontend/ — runtime implementation and buildable code

Interpretation rule:
- docs/frontend/ defines how the UI must behave
- /frontend must implement and obey those constraints

If implementation diverges from docs/frontend/,
the documentation is considered canonical
and the implementation must be corrected.

