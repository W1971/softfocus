# SoftFocus — Maintenance Mode

Status: ACTIVE  
Effective date: 2026-01-30  
Applies to: SoftFocus v1.x  
Phase reference: Phase D (archived)

---

## Purpose

This document defines **Maintenance Mode** for SoftFocus after completion of Phase D.

Maintenance Mode means:
- the system remains live and operational
- product logic is frozen
- governance remains enforced
- changes are limited to safety, stability, and observation

SoftFocus in Maintenance Mode is treated as a **stable analytical asset**, not an actively evolving product.

---

## What Is Frozen

The following elements are **explicitly frozen**:

- analytical axis  
  `burnout → recovery capacity → compensation`
- Recovery Scoring v1
- calculator logic and interpretation
- assessment structure
- UI result semantics
- canonical terminology

Any change to the above **requires a new RFC and version bump**.

---

## What Is Allowed

The following activities are allowed **without RFC**:

### 1. Operational Maintenance
- dependency updates
- build and CI fixes
- security patches
- infra / hosting adjustments

### 2. Observation & Monitoring
- traffic and indexation monitoring
- user navigation analysis
- interpretation confusion tracking
- governance friction analysis

### 3. Documentation Hygiene
- typo fixes
- clarification without semantic change
- archival notes
- cross-linking consistency

### 4. SEO Stability Work
- sitemap regeneration
- metadata corrections
- duplicate / conflict resolution
- no new role pages

---

## What Is Explicitly Not Allowed

The following are **not permitted** in Maintenance Mode:

- new analytical axes
- new calculators
- adaptive or personalized logic
- recommendations or advice
- behavioral or coaching flows
- clinical framing or terminology
- new pSEO role waves

Violations block release and must be reverted.

---

## Phase Transitions

### Exiting Maintenance Mode

Maintenance Mode may be exited **only** via one of the following:

1. **Phase E (Exploration)**
   - decision-only phase
   - no implementation
   - evidence gathering

2. **Phase F (Expansion)**
   - requires approved RFC
   - version bump (v1 → v2 or minor)
   - governance update

Until then, SoftFocus remains in Maintenance Mode.

---

## Canonical References

- Phase D archive:
  - `docs/phase-d/PHASE_D_ARCHIVE.md`
- Project bundle:
  - `artifacts/bundles/project_bundle_v1.5.0_2026-01-30.md`
- Governance overview:
  - `docs/overview.md`
- Operational readiness:
  - `docs/control/OPERATIONAL_READINESS.md`

---

## Summary

Maintenance Mode preserves the value of SoftFocus v1 by:
- preventing semantic drift
- protecting non-clinical boundaries
- minimizing operational risk
- enabling long-term use as a reference system

SoftFocus remains available, governed, and stable.

