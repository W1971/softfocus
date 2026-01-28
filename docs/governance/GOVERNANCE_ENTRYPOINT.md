# SoftFocus — Governance Entrypoint

Version: v1.1  
Status: ACTIVE  
Audience: Maintainers, auditors, CI systems

---

## Purpose

This document is the **single entry point**
into the SoftFocus governance system.

It defines:
- where canonical documentation lives;
- how scripts and workflows are organized;
- how project state and progression are tracked.

No governance-relevant work may proceed
without alignment to this entrypoint.

---

## Canonical Documentation Index

### 1. Project Documentation Library

**Path:**

Defines:
- all markdown documentation domains;
- directory structure;
- document lifecycle (ACTIVE / LOCKED / ARCHIVE);
- language rules (EN canonical, RU localized).

---

### 2. Scripts & Workflows Library

**Path:**

Defines:
- all script domains;
- governance, audit, CI, stage, and release scripts;
- canonical execution workflows;
- rules for adding or modifying scripts.

---

### 3. Project Roadmap

**Path:**

Defines:
- completed phases;
- current project state;
- allowed next phases;
- governance conditions for progression.

---

## Architecture & Phase Control

**Path:**

Contains:
- phase kickoff documents;
- phase completion locks;
- architectural flow definitions.

Only documents in this directory
may authorize phase transitions.

---

## Governance Enforcement

Governance is enforced through:
- CI workflows;
- structure audits;
- parity checks;
- append-only audit logs.

No manual override is allowed
outside defined governance scripts.

---

## Final Rule

If a document, script, or action
is not referenced directly or indirectly
from this entrypoint,
it is **not governance-authorized**.


---

## Active Invariants

- SEO vs Canonical Explanation Separation  
  → docs/governance/invariants/SEO_CANONICAL_SEPARATION.md

