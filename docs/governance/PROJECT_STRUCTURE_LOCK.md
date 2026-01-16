# SoftFocus — Project Structure Lock

Version: 1.0  
Status: LOCKED  
Audience: Core maintainers, auditors, CI systems

---

## Purpose

This document locks the **project file and directory structure**
of SoftFocus prior to Phase B (Localization).

Its goal is to prevent:
- accumulation of obsolete files;
- mixing of execution artifacts with source of truth;
- hobby-style growth of the repository.

---

## Canonical Structure

The SoftFocus repository must conform to the following structure:

- `.github/` — CI workflows only
- `docs/governance/` — LOCKED governance kernel
- `docs/architecture/active/` — versioned architectural acts
- `scripts/` — executable governance, audit, CI logic
- `tests/` — governance scenarios, helpers, templates
- `audit/` — append-only audit artifacts
- root files (`Makefile`, `SECURITY.md`, `.gitignore`)

Any deviation requires a new structure version.

---

## Hard Rules

### 1. No execution artifacts in git
- `tests/runs/RUN-*` must never be committed
- Only `EXAMPLE_RUN_000` is allowed (documentation)

---

### 2. No temporary or experimental directories
Forbidden:
- `.wip/`
- `.tmp/`
- `.backup/`
- `scratch/`
- `logs/`

Such directories must be deleted or git-ignored.

---

### 3. Script placement rules
- Shell scripts allowed only in:
  - `scripts/`
  - `tests/`
- Scenario scripts must follow:
  - `TS-<DOMAIN>-<TYPE>-<NNN>.sh`

---

### 4. Documentation boundaries
- Governance rules → `docs/governance/`
- Architecture decisions → `docs/architecture/active/`
- Test system docs → `tests/docs/`

Duplicate or informal documents are forbidden.

---

## Enforcement

- `scripts/governance/structure-audit.sh` is the canonical checker
- Any FAIL blocks Phase B and release activity
- CI may enforce this audit in future versions

---

## Final Declaration

> As of this document, the SoftFocus project structure is **LOCKED**.

All Phase B work must respect this structure.

