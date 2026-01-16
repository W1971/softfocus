# Security Policy — SoftFocus

Status: ACTIVE  
Audience: Maintainers, auditors, contributors, CI systems

---

## Purpose

This document defines how **security, integrity, and release safety**
are enforced in SoftFocus.

Security in SoftFocus is **governance-driven**.
It is enforced through executable protocols, not informal process.

---

## Core Security Principles

### 1. Governance before deployment
No code, content, or configuration may be released unless
the governance protocol authorizes it.

Deploy is not an action.  
Deploy is a consequence of permission.

---

### 2. Single canonical entry point
All readiness checks, overrides, and release authorizations
must pass through the canonical governance entry point:

scripts/governance/full-governance-run.sh

Any execution that bypasses this entry point is considered **non-compliant**
and is not trusted.

---

### 3. Immutable audit trail
Every governance decision is recorded as a RUN, identified by a unique RUN_ID,
with dual logging:

- Human-readable log (run.log)
- Machine-readable log (run.jsonl)

Logs are append-only and never edited.

---

### 4. No silent overrides
Human override decisions are:
- allowed only in LOW RISK scenarios;
- explicitly logged;
- auditable over time.

STRUCTURAL FAIL states cannot be overridden.

---

### 5. Deterministic release authorization
Releases are permitted only if:

- READY FOR DEPLOY classification is achieved;
- architecture locks are intact;
- governance self-test passes;
- CI governance gate approves.

Tag-based release is mandatory.

---

## Secrets Management

### Rules (Non-Negotiable)

- Secrets must never be committed.
- This includes:
  - real secrets
  - test secrets
  - placeholder secrets
- Secrets must not appear in documentation.
- Secrets must not appear in logs.

Violation of these rules is considered a critical security incident.

---

## Content Security

SoftFocus content is security-relevant.

The following are enforced programmatically:

- neutral, clinical tone
- no advice or instructions
- no urgency or sales language
- canonical terminology
- strict structural templates

Content drift is treated as a trust and security risk.

---

## CI Enforcement

### Mandatory Governance Self-Test

A governance self-test is executed in CI on every pull request and push to main.

- If the self-test fails, merge is blocked.
- This ensures governance integrity cannot silently degrade.

Defined in:

.github/workflows/governance-self-test.yml

---

## Vulnerability Reporting

If you discover a security vulnerability:

- Do not open a public issue.
- Contact the maintainers privately.

Security issues are triaged based on:
- impact on governance integrity;
- risk to release authorization;
- exposure of secrets or audit data.

---

## Scope of This Policy

This policy applies to:

- governance scripts
- release mechanisms
- CI enforcement
- audit and logging infrastructure
- content validation systems

This policy does not define:
- infrastructure-level security (cloud, hosting)
- user data handling (no user data is processed)

---

## Final Note

If a system cannot prove how it makes decisions,
it cannot be trusted to make them safely.

