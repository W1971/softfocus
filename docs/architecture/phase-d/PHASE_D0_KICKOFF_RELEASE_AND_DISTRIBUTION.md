# SoftFocus — Phase D-0: Release & Distribution Kickoff

Version: v1.0  
Status: ACTIVE  
Phase: D  
Step: 0  
Audience: Maintainers, auditors

---

## Purpose

This document formally **opens Phase D**
for Release & Distribution specification.

No implementation or publication is authorized here.

---

## Phase D Scope

Phase D governs:

- release definition and tagging;
- distribution eligibility;
- indexing and discoverability rules;
- release-level audit artifacts.

Phase D does not alter:
- assessment logic;
- result interpretation;
- access taxonomy;
- paid boundary rules.

---

## Release Principles

All releases must be:

- derived from a tagged commit;
- reproducible from source;
- auditable against documentation;
- compliant with Platform Manifest.

No release may originate from an untagged state.

---

## Distribution Constraints

Distribution must be:

- explicitly enabled;
- channel-specific;
- reversible;
- compliant with governance rules.

Implicit or automatic distribution is forbidden.

---

## Indexing Constraints

Indexing must be:

- explicitly declared;
- reversible;
- documented per release;
- isolated from runtime logic.

No default indexing behavior is permitted.

---

## Audit Readiness

Each release must provide:

- a release identifier;
- a commit hash;
- a documentation snapshot reference;
- a governance compliance confirmation.

---

## Governance Rule

Phase D implementation may begin only if:

- Phase C is LOCKED;
- this kickoff document exists;
- governance checks pass.

---

## Final Statement

Phase D defines **how SoftFocus is released and distributed**
without changing **what SoftFocus is**.

This document authorizes specification work only.

