# SoftFocus — Project Markdown Documentation Library

Version: v1.0  
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

This file is the **entry point** for documentation navigation.

---

## Documentation Domains

### 1. Architecture

**Path:**

**Purpose:**
- define system phases;
- lock architectural decisions;
- describe governance flows.

**Examples:**
- Phase kickoffs
- Phase completion locks
- Testing strategy
- Execution flow

Status:
- Phase 1 / Phase A: LOCKED
- Phase B: LOCKED
- Phase C: ACTIVE (after kickoff)

---

### 2. Governance

**Path:**

**Purpose:**
- define governance rules;
- describe audit, risk, READY classification;
- provide normative policies.

**Examples:**
- TEST_GOVERNANCE.md
- READY_CLASSIFICATION.md
- RISK_ESCALATION_POLICY.md
- GOVERNANCE_ENTRYPOINT.md

Status: ACTIVE

---

### 3. User Documentation

**Path:**

**Purpose:**
- neutral system descriptions;
- explanation of assessment and results;
- no advice, no conversion copy.

Status: ACTIVE  
Governed by: user-content guard

---

### 4. Roadmap & Meta

**Path:**

**Purpose:**
- high-level project overview;
- roadmap and phase state;
- contributor orientation.

---

## Language Variants

- English (EN): canonical source
- Russian (RU): localized, structure-locked

Rules:
- EN is authoritative
- RU must be structurally identical
- Structure parity enforced by CI

---

## Change Policy

- New documents must be registered in this index
- Structural changes require a new version
- Silent additions are forbidden

---

## Final Statement

This document is the **single source of truth**
for SoftFocus markdown documentation.

