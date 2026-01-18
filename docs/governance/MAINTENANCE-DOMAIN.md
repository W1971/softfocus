# SoftFocus — Maintenance / Lifecycle Domain

Version: v1.0  
Status: CANONICAL  
Scope: Repository lifecycle and hygiene

---

## Purpose

This document formally introduces the **Maintenance / Lifecycle** domain
as a first-class, non-governance authority within SoftFocus.

The domain exists to perform **intentional repository mutations**
that are explicitly forbidden in governance.

---

## Definition

**Maintenance scripts:**
- MAY mutate repository state
- MAY move, archive, or delete files
- MAY enforce hygiene rules
- MUST NOT declare or imply READY / NOT READY
- MUST NOT participate in governance decisions

---

## Authority Boundaries

| Domain | Mutation Allowed | May Decide READY | May Block Release |
|---|---|---|---|
| Governance | NO | YES | YES |
| Maintenance | YES | NO | NO |
| Release | NO | NO | NO |
| Tests | NO | NO | NO |

---

## Example Classification

### `project-cleanup.sh`

- Domain: Maintenance / Lifecycle
- Behavior: Archival, cleanup, hygiene
- Authority: Non-decisional
- Governance eligibility: **FORBIDDEN**

This script is correct **only if treated as maintenance**.

---

## Hard Rule

> Any script that mutates repository state
> is disqualified from governance by definition.

---

## Placement Recommendation

Maintenance scripts SHOULD reside under one of:

- `scripts/maintenance/`
- `scripts/lifecycle/`
- `scripts/archive/`

They MUST NOT reside under `scripts/governance/`.

---

End of document.
