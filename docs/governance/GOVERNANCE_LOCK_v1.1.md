# SoftFocus — Governance Lock v1.1

Version: 1.1  
Status: LOCKED  
Audience: Core maintainers, auditors, CI systems

---

## Purpose

This document formally declares **Governance v1.1** in SoftFocus as **LOCKED**.

Locking governance means:
- the protocol is complete;
- the system is internally consistent;
- the system is enforced technically;
- changes are not allowed silently or incrementally.

---

## Scope of the Lock

The following components are LOCKED under Governance v1.1:

### 1. Governance Protocol
- `scripts/governance/full-governance-run.sh`
- `scripts/governance/full-governance-run-with-export.sh`
- Single-command, linear execution model
- No bypass allowed

---

### 2. Readiness Classification
- READY FOR DEPLOY
- LOW RISK
- STRUCTURAL FAIL

Defined in:
- `docs/governance/READY_CLASSIFICATION.md`

Rules regarding override and release authorization are LOCKED.

---

### 3. Logging and Audit Model
- Dual logging:
  - Human-readable (`run.log`)
  - Machine-readable (`run.jsonl`)
- Append-only invariant
- RUN / RUN_ID semantics

Defined in:
- `docs/governance/TEST_GOVERNANCE.md`
- `docs/governance/GOVERNANCE_TERMS.md`

---

### 4. Governance Self-Test
- `tests/scenarios/TS-GOVERNANCE-SELF-001.sh`
- Self-test verifies governance integrity
- Self-test must pass for merge or release

---

### 5. CI Enforcement
- Mandatory CI job:
  - `.github/workflows/governance-self-test.yml`
- Failure blocks merge to `main`

CI enforcement is part of the locked governance boundary.

---

### 6. Risk Escalation Policy
- LOW RISK escalation rules
- STRUCTURAL FAIL non-override rule

Defined in:
- `docs/governance/RISK_ESCALATION_POLICY.md`

---

### 7. Security Boundary
- Governance-driven security model
- Secrets policy
- Release authorization constraints

Defined in:
- `SECURITY.md`

---

## What Is NOT Allowed Under This Lock

The following actions are forbidden under Governance v1.1:

- Modifying governance scripts without version bump
- Changing READY classification semantics
- Weakening or removing CI self-test enforcement
- Allowing release without READY FOR DEPLOY
- Introducing alternative entry points
- Editing historical RUN logs
- Silently redefining governance terminology

Any of the above requires a **new governance version**.

---

## Allowed Changes Without Breaking the Lock

The following changes are allowed and do **not** break the lock:

- Adding new test scenarios (`TS-*`) that comply with v1.1
- Adding new documentation that does not redefine locked rules
- Adding new Phase B / Phase C functionality gated by governance
- Refactoring application code unrelated to governance

---

## Procedure to Unlock or Change Governance

To modify governance:

1. Create a new versioned proposal:
   - e.g. `GOVERNANCE_v1.2_PROPOSAL.md`
2. Explicitly describe:
   - what changes
   - why the change is required
   - impact on audit and CI
3. Implement changes under the new version
4. Add a new self-test if required
5. Lock the new version with a new LOCK document

Silent changes are forbidden.

---

## Final Declaration

As of this document:

> **Governance v1.1 in SoftFocus is LOCKED.**

All releases, CI checks, and audits
must comply with this locked protocol.

