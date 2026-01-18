# SoftFocus — Project Markdown Documentation Library

Version: v1.1  
Status: ACTIVE  
Audience: Maintainers, auditors, contributors

---

## Purpose

This document provides a **canonical index of all markdown documentation**
in the SoftFocus project.

It defines:
- document domains;
- directory structure;
- purpose of each document group;
- lifecycle status (ACTIVE / LOCKED / ARCHIVE).

This file is the **single entry point** for documentation navigation.

---

## Documentation Domains

### 1. Architecture

**Path:** `docs/architecture/`

**Purpose:**
- define system phases;
- lock architectural decisions;
- describe governance and release flows.

**Includes:**
- Phase kickoffs
- Phase locks
- Enforcement specifications
- Release and distribution rules

**Status:**
- Phase 1 / Phase A: LOCKED
- Phase B: LOCKED
- Phase C: LOCKED
- Phase D: LOCKED

---

### 2. Governance

**Path:** `docs/governance/`

**Purpose:**
- define governance rules;
- describe audit, risk, READY classification;
- provide normative policies.

**Examples:**
- TEST_GOVERNANCE.md
- READY_CLASSIFICATION.md
- RISK_ESCALATION_POLICY.md
- GOVERNANCE_ENTRYPOINT.md

**Status:** ACTIVE

---

### 3. User Documentation

**Path:** `docs/user/`

**Purpose:**
- neutral system descriptions;
- explanation of assessment and results;
- no advice, no conversion copy.

**Status:** ACTIVE  
Governed by: user-content guard

---

### 4. Roadmap & Meta

**Path:** `docs/roadmap/`

**Purpose:**
- project progression overview;
- phase state tracking;
- contributor orientation.

---

## Language Variants

- English (EN): canonical source
- Russian (RU): localized, structure-locked

**Rules:**
- EN is authoritative
- RU must be structurally identical
- Structure parity enforced by CI

---

## Change Policy

- New documents must be registered here.
- Structural changes require a new version.
- Silent additions are forbidden.

---

## Final Statement

This document is the **single source of truth**
for SoftFocus markdown documentation structure and lifecycle.
