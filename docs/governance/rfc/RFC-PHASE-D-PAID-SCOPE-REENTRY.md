# RFC: Paid Scope Re-entry (Phase D)

**RFC ID:** RFC-PHASE-D-PAID-SCOPE-REENTRY  
**Status:** DRAFT  
**Phase:** D  
**Baseline:** phase-c-audit-handoff  
**Severity:** CRITICAL

---

## 1. Purpose

Define strict conditions under which paid functionality
may be reintroduced in Phase D
without violating Phase C invariants.

This RFC does NOT authorize paid features by itself.
It defines the governance gate.

---

## 2. Core Principle

Paid scope must never:
- alter analytical logic
- alter interpretation
- introduce recommendations or norms
- create behavioral pressure

Paid access is an entitlement layer,
not a semantic or analytical layer.

---

## 3. Allowed Paid Classes (Phase D)

Paid functionality MAY include:
- gated access to existing calculators
- gated access to extended explanations
- gated export formats (PDF / data views)

All paid content MUST:
- reuse frozen analytical cores
- reuse canonical interpretation
- differ only in access, not meaning

---

## 4. Forbidden Paid Classes

Paid functionality MUST NOT include:
- advice or “what to do next”
- recovery plans or strategies
- timelines or projections
- personalization or adaptive logic
- clinical or therapeutic framing

Any violation is a Phase D FAIL.

---

## 5. UI Constraints for Paid Scope

Paid UI:
- must not introduce urgency
- must not use motivational language
- must not imply benefit beyond access

Payment must feel administrative,
not corrective or hopeful.

---

## 6. Audit & Enforcement

Before any paid release:
- a dedicated RFC must be approved
- audit-script must pass with 0 FAIL
- a paid-scope diff against baseline must be generated

---

## 7. Non-Goals

This RFC does not:
- approve specific products
- define pricing
- define UX flows
- define marketing language

---

## Summary

Phase D allows paid scope re-entry
only as a controlled access layer.

Meaning, interpretation, and logic
remain governed by Phase C invariants.

