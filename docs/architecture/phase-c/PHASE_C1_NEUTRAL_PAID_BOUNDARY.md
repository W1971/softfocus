# SoftFocus — Phase C-1: Neutral Paid Boundary Specification

Version: v1.0  
Status: ACTIVE  
Phase: C  
Step: 1  
Audience: Maintainers, auditors

---

## Purpose

This document defines the **neutral paid boundary** for the SoftFocus system.

It specifies:
- what may be gated;
- what must never be gated;
- how free and paid layers are separated;
- which invariants are preserved.

No UX, copy, pricing, or conversion mechanisms are defined here.

---

## Definition

A **Paid Boundary** is a rule-based access limitation that:
- does not alter assessment logic;
- does not alter result interpretation;
- does not modify classification outcomes;
- affects only access scope or presentation layer.

---

## Immutable Invariants

The following elements are **never gated**:

- assessment questions;
- scoring logic;
- classification rules;
- base result meaning;
- risk interpretation;
- READY / NOT READY status logic.

Any change to these elements is forbidden in Phase C.

---

## Allowed Paid Scope

The paid layer may control access to:

- extended explanations;
- comparative historical views;
- export formats (PDF, JSON, CSV);
- aggregation across runs;
- dashboards or summaries built on existing results.

All paid features must consume **already computed results** only.

---

## Forbidden Actions

The paid layer must never:

- re-score answers;
- modify thresholds;
- re-label outcomes;
- introduce urgency or pressure language;
- imply degraded correctness for free access;
- block access to the base result.

---

## Separation Rule

Free and paid layers must be:

- logically isolated;
- independently testable;
- independently removable without affecting results.

Paid components must fail gracefully.

---

## Governance Constraints

- This boundary is enforced by governance scripts.
- Violations block Phase progression.
- Any extension requires a new Phase C document.

---

## Auditability

This document is:
- versioned;
- structure-locked;
- subject to EN↔RU parity rules.

Changes require governance approval.

---

## Final Statement

Phase C-1 defines **where monetization may exist**  
without altering **what SoftFocus means**.

