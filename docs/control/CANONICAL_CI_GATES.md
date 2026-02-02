---
type: control-contract
scope: ci
mutability: frozen
---
## Phase Binding

These CI gates are **binding for Phase D (Maintenance Mode)**.

While Phase D is active:
- gate definitions are immutable
- scripts may not be modified
- invocation rules may not be changed

Changing any gate requires:
- explicit exit from Phase D
- new governance declaration

# SoftFocus — Canonical CI Gates

This document defines **mandatory CI gates**
that must pass for any commit to be accepted.

No gate may be bypassed.
No gate may be weakened without governance approval.

---

## Gate: ACTIVE_DOCS_ONLY

Script:
scripts/ci/check-active-docs-only.sh

Purpose:
- enforce strict active documentation scope
- prevent semantic drift
- block accidental introduction of non-canonical docs

Severity:
FAIL (blocking)

Invocation:
- pre-commit
- CI (push, pull_request)

Rationale:
Documentation defines product meaning.
Unscoped documents are a governance violation.

---

## Governance Rule

If this gate fails:
- commit MUST be rejected
- CI MUST fail
- no override is allowed


---

## Gate: RUNTIME_SPLIT_ENFORCER

Script:
scripts/ci/RUNTIME_SPLIT_ENFORCER.sh

Purpose:
- enforce strict separation of mobile / web / shared runtime
- prevent cross-scope contamination
- guarantee governance alignment at filesystem level

Severity:
FAIL (blocking)

Invocation:
- CI only (push, pull_request)

Override:
Not allowed.

