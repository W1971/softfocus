# SoftFocus — Scripts Library & Workflow Map

Version: v1.1  
Status: ACTIVE  
Audience: Maintainers, CI systems, auditors

---

## Purpose

This document defines the **canonical script library**
and explains how scripts compose
the SoftFocus execution and release workflows.

Scripts are not helpers.  
They are **state transition and authority mechanisms**.

---

## Script Domains

### 1. Governance Scripts

**Path:** `scripts/governance/`

**Purpose:**
- enforce project state;
- block invalid transitions;
- protect structure, meaning, and phase integrity.

**Key scripts:**
- full-governance-run.sh
- project-cleanup.sh
- structure-audit.sh
- structure-parity-check.sh
- structure-diff-report.sh
- user-content-guard.sh
- indexing-guard.sh
- release-audit-check.sh

---

### 2. Audit Scripts

**Path:** `scripts/audit/`

**Purpose:**
- append-only logging;
- audit trail generation;
- governance verification support.

**Characteristics:**
- machine-readable;
- immutable;
- never influence runtime behavior.

---

### 3. Test & CI Scripts

**Path:** `scripts/ci/`

**Purpose:**
- enforce governance in CI;
- validate structure, content, and logs;
- block invalid merges and releases.

---

### 4. Stage & Release Scripts

**Path:** `scripts/deploy/`

**Purpose:**
- preflight validation;
- production gating;
- release readiness enforcement.

**Key scripts:**
- deploy-preflight.sh
- deploy-production.sh
- deploy-check.sh

---

## Canonical Workflow

```text
project-cleanup.sh
        ↓
structure-audit.sh
        ↓
structure-parity-check.sh
        ↓
content & scenario tests
        ↓
verify-test-logs.sh
        ↓
READY classification
        ↓
release-audit-check.sh
        ↓
indexing-guard.sh
        ↓
(go / block)
Hard Rules
No script may bypass this flow.
Governance scripts override convenience.
Release scripts never mutate content.
Change Policy
Scripts may only be added via governance.
Deletions require archival.
Behavior changes require documentation update.
Final Statement
This script library defines how SoftFocus operates as a controlled system,
from development to release readiness.
