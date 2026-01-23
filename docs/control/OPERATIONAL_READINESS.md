# Operational Readiness — SoftFocus v1

**Status:** NORMATIVE  
**Applies to:** SoftFocus v1.x  
**Effective from:** declaration event

---

## 1. Purpose

This document defines the exact conditions under which **SoftFocus v1**
is considered **operationally ready**.

Operational readiness marks the transition from:
- implementation → operation
- project → asset

Once declared, SoftFocus v1 is treated as a stable, governed system.

---

## 2. Definition of Operational Readiness

SoftFocus v1 is considered **operationally ready** if and only if
**all conditions below are satisfied simultaneously**.

This status is binary.
Partial readiness does not exist.

---

## 3. Required Conditions (All Mandatory)

### 3.1 Governance

- Content governance rules are active
- `content-validator` executes without FAIL
- Non-clinical boundaries are enforced
- Severity handling (PASS / WARN / FAIL) matches specification

### 3.2 Product Logic

- At least one product-grade assessment or calculator is active
- All scoring is deterministic
- Interpretation is explainable
- No motivational, advisory, or clinical language is present

### 3.3 Entitlement Execution

- Entitlement delivery executes without manual intervention
- Each execution emits a record to `run.jsonl`
- Records are:
  - timestamped
  - uniquely identifiable
  - non-ambiguous
- Severity of entitlement execution is PASS

### 3.4 Control Plane

- `alias-softfocus` is the single execution entry point
- Alias statuses are generated automatically
- No manual status overrides exist
- Core aliases resolve to READY or LOW_CONFIDENCE only

### 3.5 Distribution Boundary

- Distribution pages do not modify product logic
- Role-based or SEO pages act as overlays only
- No calculators, assessments, or protocols are embedded in distribution layers

---

## 4. Explicit Non-Goals

Operational readiness **does NOT imply**:

- product–market fit
- traffic volume
- revenue level
- payment provider integration
- user growth or engagement metrics

These signals are intentionally excluded.

---

## 5. Freeze Semantics

Once SoftFocus v1 is declared operationally ready:

- Product logic is frozen
- Calculators and assessments are immutable
- Governance rules are stable for v1.x
- CI rules are not relaxed
- Only distribution-layer changes are permitted

Any change to product logic requires a new major version.

---

## 6. Relationship to Lifecycle Phases

- Phase A (Operation & Observation) begins only after readiness declaration
- Phase B (Minor Expansion) may occur without modifying product logic
- Phase C (Major Expansion) requires a new analytical axis (v2.x)

---

## 7. Relationship to v2

Version v2 **cannot be initiated** unless:

- SoftFocus v1 is formally declared operationally ready
- This document is satisfied in full

v2 documents may exist in DESIGN ONLY state prior to readiness,
but grant no execution authority.

---

## 8. Declaration Event

Operational readiness is declared when:

- All conditions in Section 3 are met
- CI passes without exception
- A tagged release is created
- No pending FAIL or masked WARN exists

After declaration, SoftFocus v1 is an operational asset.
