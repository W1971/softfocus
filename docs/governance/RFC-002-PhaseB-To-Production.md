# RFC-002: Phase B → Production Transition

Status: DRAFT  
Version: 1.0  
Audience: Core maintainers, auditors, CI systems

---

## 1. Purpose

This RFC formalizes the conditions and enforcement gates required to transition
SoftFocus from Phase B (Localization / V2 content evolution) into Production.

The goal is to ensure that Production deployment is:
- governance-stable;
- structurally invariant;
- audit-valid;
- CI-enforced.

---

## 2. Definitions

**Phase B**: Content evolution and localization/V2 work under a locked repository structure.  
**Production**: Release/deploy eligible state with mandatory CI enforcement and append-only audit.

**Structural mutation**: Any new, removed, or relocated top-level directory or root file outside the locked allowlist.

---

## 3. Non-negotiable Rule

> If it is not automatically enforced, it is not a rule.

This RFC is considered active only when CI enforcement is enabled.

---

## 4. Gate: Phase B → Production

Transition to Production is allowed only when ALL conditions hold:

### 4.1 Governance checks
- `scripts/governance/policy-eval.sh` returns PASS
- lifecycle policy indicates `current_phase: B` at evaluation time
- promotion to Production is performed only via approved mechanism (see Section 6)

### 4.2 Structure invariance
- structure allowlist check passes (no structural mutations)
- no forbidden directories exist
- no execution artifacts are committed (e.g., test runs)

### 4.3 Content readiness
- content validator passes (boundary-aware checks)
- V2 critical docs complete (as defined by product manifest for release)

### 4.4 Audit integrity
- audit artifacts remain append-only
- a production promotion entry is appended (timestamp + identity + transition)

### 4.5 CI enforcement
- CI runs governance gate on PR and on main
- failures block merges and releases

---

## 5. Failure Policy

If any gate condition fails:
- transition is blocked;
- merges/releases are blocked;
- remediation must occur within Phase B (no bypass).

If a structural change is required:
- a new structure version must be declared;
- the project returns to Phase A to re-lock structure.

---

## 6. Promotion Mechanism

Production promotion must be executed by an explicit script (e.g. `phase-promote.sh B -> PRODUCTION`)
that performs:
- policy update;
- append-only audit entry;
- immediate governance re-check.

---

## 7. Adoption

This RFC becomes ACTIVE when:
- the Production promotion mechanism exists;
- CI enforces this RFC gates automatically.

