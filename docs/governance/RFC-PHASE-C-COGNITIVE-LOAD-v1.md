# RFC — Phase C: Cognitive Load Accumulation Axis

**RFC ID:** RFC-PHASE-C-COGNITIVE-LOAD-v1  
**Status:** DRAFT  
**Phase:** C  
**Date:** 2026-01-26

---

## 1. Purpose

Introduce a new analytical axis focused on
**cognitive load accumulation under sustained effort**.

This axis is fully independent from:
- burnout
- recovery capacity
- compensation patterns (v1)

---

## 2. Rationale

Operational observation of Phase A/B indicates that
cognitive overload often precedes measurable recovery degradation.

This axis enables:
- earlier orientation
- different signal types
- separate user entry points

---

## 3. Scope

### In Scope
- New scoring model (v2 only)
- Separate calculator family
- Independent interpretation protocol
- Versioned UI and copy

### Out of Scope
- Any modification of Recovery Scoring v1
- Reinterpretation of v1 results
- Shared scoring primitives

---

## 4. Architecture Constraints

- Hard namespace separation (`v2/`)
- No shared scoring files with v1
- Independent QA fixtures
- Same entitlement & audit model

---

## 5. Risks & Mitigations

| Risk | Mitigation |
|----|----|
| Axis confusion | Explicit versioned copy |
| Governance bleed | RFC-gated changes only |
| Scope creep | Single-axis limit |

---

## 6. Decision Required

Approval to:
- Enter Phase C
- Create v2 analytical namespace
- Begin Cognitive Load axis work
