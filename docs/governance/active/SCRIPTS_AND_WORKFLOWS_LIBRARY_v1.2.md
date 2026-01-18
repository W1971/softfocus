# SoftFocus — Scripts Library & Workflow Map

Version: v1.2  
Status: LOCKED  
Audience: Maintainers, CI systems, auditors

---

## Purpose

This document defines the **canonical script library**
and describes how scripts compose
the SoftFocus execution, validation, and release workflows.

Scripts are not helpers.  
They are **state transition and authority mechanisms**.

No script is optional if it participates in a gated workflow.

---

## Script Domains

---

## 1. Governance Scripts

**Path:** `scripts/governance/`

**Purpose:**
- enforce project state;
- define release readiness gates;
- block invalid lifecycle transitions.

**Characteristics:**
- authoritative;
- deterministic;
- final arbiters of “READY / NOT READY”.

**Active scripts:**

- `ready-gate.sh`  
  Final release gate.  
  Must be reached only after all prior checks pass.  
  Emits authoritative **RELEASE STATUS**.

> Governance scripts **never mutate content**.  
> They only evaluate state and decide admissibility.

---

## 2. Content Validation Scripts

**Path:** `scripts/content-validator/`

**Purpose:**
- enforce language and boundary policy;
- prevent clinical, diagnostic, or disallowed content;
- classify violations by audience and severity.

**Policy Source:**
- `CONTENT_VALIDATION_RULES_v1.4`

**Characteristics:**
- boundary-aware;
- policy-driven;
- fail-fast on violations.

**Key script:**

- `validate-content.js`  
  Executes **CONTENT_VALIDATION_RULES_v1.4**  
  Produces ALLOW / BLOCK decisions per document.

---

## 3. Audience Coverage Scripts

**Path:** `scripts/audience-checker/`

**Purpose:**
- verify audience segmentation coverage;
- ensure required audience classes are represented;
- prevent accidental omission of target groups.

**Current state:**
- stubbed;
- non-blocking;
- explicitly reports skip status.

**Key script:**

- `check-audience-coverage.js`  
  Emits PASS / SKIPPED with traceable output.

---

## 4. Release Orchestration Scripts

**Path:** `scripts/release/`

**Purpose:**
- compose validation steps into a single release flow;
- enforce correct execution order;
- act as CI and human entrypoint.

**Key script:**

- `release-ready.sh`

**Responsibilities:**
- archive verification;
- content validation (policy v1.4);
- audience coverage check;
- governance gate invocation.

This script defines the **only supported release path**.

---

## Canonical Release Workflow

```text
release-ready.sh
        ↓
archive verification
        ↓
content-validator (CONTENT_VALIDATION_RULES_v1.4)
        ↓
audience coverage check
        ↓
READY gate (governance)
        ↓
RELEASE STATUS: READY / BLOCK

## Hard Rules

No script may bypass release-ready.sh
Governance decisions override convenience
Validation scripts may block, never auto-fix
Release scripts never mutate content
READY status must be explicit and logged

## Change Policy

This document is LOCKED
Changes require:
new version,
explicit supersession,
governance approval.
Script behavior changes MUST update this document.

## Final Statement

This script library defines how SoftFocus operates
as a controlled, auditable, boundary-safe system —
from content evolution to release readiness.
There is no implicit execution.
There is no silent success.
Only declared state transitions are valid.


---

## 2️⃣ Явная синхронизация с `CONTENT_VALIDATION_RULES_v1.4`

**Синхронизация подтверждена по контракту:**

| Элемент | Источник |
|------|---------|
| Boundary logic | `CONTENT_VALIDATION_RULES_v1.4` |
| Zone handling | STRICT / PUBLIC / B2B / PRODUCT |
| Clinical term enforcement | validator v1.4.1 |
| Allow-with-boundary | explicitly documented |
| Fail-fast semantics | enforced |

Никакой дублирующей политики.  
**Единый источник истины — rules v1.4.**

---

## 3️⃣ CI YAML — строго повторяет `release-ready.sh`

### `.github/workflows/release-ready.yml`

```yaml
name: SoftFocus Release Readiness

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  release-ready:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Make scripts executable
        run: |
          chmod +x scripts/release/release-ready.sh
          chmod +x scripts/governance/ready-gate.sh

      - name: Run release readiness sequence
        run: |
          ./scripts/release/release-ready.sh
