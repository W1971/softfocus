# SoftFocus — Scripts Library & Workflow Map

Version: v1.0  
Status: ACTIVE  
Audience: Maintainers, CI systems, auditors

---

## Purpose

This document defines the **canonical script library**
and explains how scripts compose
the SoftFocus execution workflows.

Scripts are not helpers.
They are **state transition mechanisms**.

---

## Script Domains

### 1. Governance Scripts

**Path:**

**Purpose:**
- enforce project state;
- block invalid transitions;
- protect structure and meaning.

**Key scripts:**
- full-governance-run.sh
- project-cleanup.sh
- structure-audit.sh
- structure-parity-check.sh
- structure-diff-report.sh
- user-content-guard.sh

---

### 2. Audit Scripts

**Path:**

**Purpose:**
- append-only logging;
- audit trail generation;
- export for dashboards.

---

### 3. Test & CI Scripts

**Path:**

**Purpose:**
- enforce governance in CI;
- validate logs and structure;
- block invalid merges.

---

### 4. Stage & Release Scripts

**Path:**

**Purpose:**
- define phase execution;
- control promotion and release;
- ensure reproducibility.

---

## Canonical Workflow

```text
project-cleanup.sh
        ↓
structure-audit.sh
        ↓
structure-parity-check.sh
        ↓
tests / scenarios
        ↓
verify-test-logs.sh
        ↓
READY classification
        ↓
(go / block)
No script may bypass this flow.
Change Policy
Scripts may only be added via governance
Deletions require archival
Behavior changes require documentation update
Final Statement
This script library defines
how SoftFocus operates as a system.
