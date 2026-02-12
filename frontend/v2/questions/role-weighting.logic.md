# SoftFocus v2 — Role-Based Weighting Logic (Design-Only)

**Status:** DESIGN-ONLY  
**Phase:** Phase A — Analytical Exploration  
**Executability:** NONE  
**Last updated:** 2026-02-11

---

## Purpose

This document defines **role-sensitive analytical emphasis**
for SoftFocus v2.

It does **not** define:
- scoring
- coefficients
- thresholds
- severity levels

Instead, it specifies which **dimensions and signals**
carry higher **interpretive weight** for different role archetypes.

---

## Core Principle

Roles do not change:
- questions
- dimensions
- signals

Roles only affect:
- **signal salience**
- **pattern sensitivity**
- **interpretive focus**

---

## Role Archetypes (Canonical)

The following archetypes are analytical,
not HR, industry, or title-based.

- Executive / Founder
- Risk / Compliance
- Product / Program
- Operations / Delivery
- Individual Contributor (IC)

---

## Role Emphasis Matrix

| Role Archetype | Dimension A | Dimension B | Dimension C | Dominant Risk Pattern |
|---------------|-------------|-------------|-------------|----------------------|
| Executive / Founder | Medium | High | Medium | Vigilance Trap |
| Risk / Compliance | Medium | High | High | Silent Fragmentation |
| Product / Program | High | Medium | Medium | Compensated Instability |
| Operations / Delivery | High | Medium | High | Structural Drift |
| Individual Contributor | Low–Medium | Low | Medium | Local Overload |

---

## Interpretive Notes by Role

### Executive / Founder
- High responsibility without closure
- Control illusion often central
- Fragmentation masked by authority

Primary focus: **B → C**

---

### Risk / Compliance
- Continuous vigilance
- Low tolerance for uncertainty
- Fragmentation accumulates silently

Primary focus: **B → C**, secondary **A**

---

### Product / Program
- Volatile priorities
- External dependency load
- Compensation through anticipation

Primary focus: **A → B**

---

### Operations / Delivery
- Constant throughput pressure
- Execution under instability
- Fragmentation becomes structural

Primary focus: **A → C**

---

### Individual Contributor (IC)
- Lower control illusion
- Fragmentation often situational
- Environment more bounded

Primary focus: **C (local)**

---

## Boundary Rules

- Role weighting must never:
  - hide dimensions
  - suppress signals
  - normalize overload
- All roles still observe all dimensions.
- Weighting adjusts **interpretation priority only**.

---

## Forward Compatibility

If SoftFocus v2 enters implementation phases,
this document may inform:

- question ordering
- result emphasis
- narrative framing

It must **not** be converted directly into coefficients
without an explicit scoring design phase.

