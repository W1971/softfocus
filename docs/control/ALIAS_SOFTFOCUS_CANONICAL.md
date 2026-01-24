---
title: "alias-softfocus — Canonical Alias Registry"
status: ACTIVE
scope: control-plane
---

# alias-softfocus

`alias-softfocus` is the **control-plane CLI** for the SoftFocus project.

It provides a single, auditable entry point for:
- scripts
- documentation
- validation
- diagnostics
- governance state

This registry defines **all recognized aliases**,
their scope, status, and execution permissions.

---

## Status Model

Each alias has one derived status:

- **READY** — execution allowed
- **LOW_CONFIDENCE** — execution restricted / observational
- **DESIGN_ONLY** — execution forbidden
- **UNKNOWN** — not trusted
- **FAIL** — blocked

Status affects:
- CI behavior
- execution permissions
- release eligibility

---

## CORE ALIASES (Execution-Critical)

### project-clean
- Scope: scripts
- Purpose: Structural hygiene and maintenance
- Status: READY
- Risk level: LOW
- Scripts:
  - scripts/maintenance/*
  - scripts/audit/*
- Scenarios:
  - TS-GOVERNANCE-SELF-001

---

### content-validate
- Scope: scripts
- Purpose: Content validation and audience discipline
- Status: READY
- Risk level: LOW
- Scripts:
  - backend/scripts/content-validator/*
- Scenarios:
  - TS-READY-BASE-001

---

### pipeline-check
- Scope: scripts
- Purpose: Stage readiness and linear execution gating
- Status: READY
- Risk level: MEDIUM
- Scripts:
  - scripts/ci/*
- Scenarios:
  - TS-READY-BASE-010

---

### generate-status
- Scope: scripts
- Purpose: Derive system readiness from signals
- Status: READY
- Risk level: LOW
- Scripts:
  - alias_softfocus/bin/generate-status

---

## OPERATIONAL ALIASES

### release-controller
- Scope: scripts
- Purpose: Release eligibility and tagging
- Status: READY
- Risk level: MEDIUM
- Scripts:
  - scripts/release/*
- Scenarios:
  - TS-RELEASE-001

---

### test-oracle
- Scope: tests
- Purpose: Behavioral and scenario verification
- Status: ACTIVE
- Risk level: LOW
- Scripts:
  - tests/scenarios/*
  - tests/helpers/*

---

### logging-contract
- Scope: tests
- Purpose: Log format and observability contract
- Status: ACTIVE
- Risk level: LOW
- Scripts:
  - tests/docs/*
  - tests/templates/*

---

## GOVERNANCE / OBSERVATION ALIASES

### phase-a-observation
- Scope: documentation
- Purpose: Enforce Phase A observation-only constraints
- Status: READY
- Risk level: LOW
- CI Gate:
  - scripts/ci/check-phase-a-observation-only.sh

---

### mobile-v1-governance
- Scope: frontend/mobile
- Purpose: Enforce Mobile v1 freeze and simplicity
- Status: READY
- Risk level: LOW
- CI Gates:
  - scripts/ci/check-mobile-design.sh

---

## v2 DESIGN-ONLY ALIASES (NO EXECUTION)

### v2-governance
- Scope: roadmap
- Purpose: Govern SoftFocus v2 as a design-only analytical axis
- Status: DESIGN_ONLY
- Risk level: MEDIUM
- Execution: FORBIDDEN

Enforces:
- no implementation
- no UI or product wiring
- no action-oriented language
- no axis mixing with v1

CI Gate:
- scripts/ci/check-v2-governance.sh

Failure blocks:
- release
- tagging
- roadmap progression

---

## OPTIONAL / LEGACY ALIASES

### pipeline-guard (legacy)
- Scope: scripts
- Purpose: Historical stage framework
- Status: LOW_CONFIDENCE
- Risk level: MEDIUM
- Notes: Deprecated; retained for reference only

---

## Design Principles

- Docs are first-class
- One entry point
- Explicit status
- No silent execution
- Auditability over convenience

If an alias is not listed here,
it is **not recognized by the control plane**.

