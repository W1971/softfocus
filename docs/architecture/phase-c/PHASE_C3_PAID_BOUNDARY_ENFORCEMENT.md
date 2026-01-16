# SoftFocus — Phase C-3: Paid Boundary Enforcement Rules

Version: v1.0  
Status: ACTIVE  
Phase: C  
Step: 3  
Audience: Maintainers, auditors

---

## Purpose

This document defines **formal enforcement rules**
for the paid boundary in SoftFocus.

It specifies how access is checked and denied
without introducing UX, copy, or persuasion.

---

## Enforcement Scope

Enforcement applies only to:
- resources declared as paid in Phase C-1;
- access classes defined in Phase C-2.

Enforcement never applies to:
- assessment execution;
- scoring;
- base result delivery.

---

## Enforcement Inputs

The enforcement layer may read:
- requested resource identifier;
- required access class for that resource;
- user's current access class.

The enforcement layer must not read:
- assessment answers;
- scores;
- classifications;
- interpretations.

---

## Decision Rules

1. If required access class ≤ user access class  
   → ALLOW access.

2. If required access class > user access class  
   → DENY access.

No other conditions are evaluated.

---

## Denial Characteristics

All denials must be:
- deterministic;
- silent in terms of persuasion;
- non-degrading to base access;
- reversible upon access class change.

No alternative messaging is defined here.

---

## Failure Handling

If the enforcement layer fails:
- default behavior is ALLOW for Class 0 resources;
- default behavior is DENY for paid resources;
- system stability must be preserved.

---

## Separation Requirement

The enforcement mechanism must be:
- logically isolated;
- independently testable;
- removable without affecting assessment logic.

---

## Auditability

Each enforcement decision must be:
- loggable;
- traceable to a rule in this document;
- reproducible under audit conditions.

---

## Governance Constraints

- These rules are binding for Phase C.
- Any modification requires a new Phase C step.
- Violations block phase progression.

---

## Final Statement

Phase C-3 defines **how paid boundaries are enforced**
without altering **what SoftFocus computes or means**.

