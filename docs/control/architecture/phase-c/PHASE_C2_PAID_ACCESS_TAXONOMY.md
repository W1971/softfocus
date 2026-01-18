# SoftFocus — Phase C-2: Paid Access Taxonomy

Version: v1.0  
Status: ACTIVE  
Phase: C  
Step: 2  
Audience: Maintainers, auditors

---

## Purpose

This document defines the **taxonomy of access classes**
for the paid layer of SoftFocus.

It enumerates access levels without describing UX,
pricing, or persuasive elements.

---

## Access Class Principles

All access classes must comply with:

- immutability of assessment logic;
- immutability of result interpretation;
- consumption of precomputed results only;
- graceful removal without system impact.

---

## Access Classes

### Class 0 — Base Access (Free)

Scope:
- single-run result view;
- base classification output;
- canonical interpretation text.

Notes:
- always available;
- never restricted.

---

### Class 1 — Extended Insight

Scope:
- expanded explanatory material;
- contextual notes derived from results;
- non-interactive extensions.

Inheritance:
- includes Class 0.

---

### Class 2 — Comparative Access

Scope:
- comparison across multiple runs;
- historical alignment views;
- cross-result aggregation.

Inheritance:
- includes Class 1 and Class 0.

---

### Class 3 — Export & Portability

Scope:
- structured exports (PDF, JSON, CSV);
- offline representations;
- machine-readable formats.

Inheritance:
- includes Class 2, Class 1, and Class 0.

---

### Class 4 — Analytical Overview

Scope:
- dashboards built on existing results;
- summary metrics;
- trend visualization based on stored data.

Inheritance:
- includes Class 3, Class 2, Class 1, and Class 0.

---

## Explicit Exclusions

No access class may:

- alter scores;
- re-label outcomes;
- introduce recommendations;
- change READY classification logic;
- gate the base result.

---

## Governance Constraints

- This taxonomy is binding for Phase C.
- New classes require a new Phase C step.
- Reordering or renaming requires governance approval.

---

## Auditability

This document is:
- versioned;
- structure-locked;
- enforced by governance scripts.

---

## Final Statement

Phase C-2 defines **how access is classified**
without defining **how it is sold or presented**.

