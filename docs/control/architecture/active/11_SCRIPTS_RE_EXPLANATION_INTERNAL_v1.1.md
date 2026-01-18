# SoftFocus — Scripts Re-Explanation (Internal)

Version: v1.1  
Status: INTERNAL / ACTIVE  
Audience: Core maintainer only  

---

## Purpose

This document explains why each script exists,
what systemic risk it prevents,
and how scripts together enforce a production-ready SoftFocus workflow.

Scripts are not helpers.
They are governance, safety, and state-transition mechanisms.

---

## 0) Core Principles

- **Source of truth stays clean**
  - Only application code and canonical documentation live in git.
- **Noise is removable**
  - Builds, caches, logs, dependencies are disposable artifacts.
- **Secrets never enter history**
  - Not real keys, not test keys, not placeholders.
- **Validation is structural**
  - Tone, terminology, and structure are enforced by code.
- **Scaling is gated**
  - Expansion (SEO, localization, conversion) is impossible without readiness.

---

## 1) Archive Script (Bash)

### Purpose

Create a timestamped archive of files that must never be committed
or that commonly break pushes and releases.

### What it protects

- Accidental commits of:
  - `.env*` secrets
  - `node_modules`
  - `.next`, `out`, `.vercel`, `build`
  - logs and debug artifacts
- GitHub push protection failures
- Large binary rejections
- Repeated secret-scanning incidents

### Operational role

Used before:
- release builds
- force-push or history rewrite
- environment transitions

### Design constraints

- Non-destructive (move, never delete)
- Archive stored under `archive/<timestamp>/`
- Archive path is always git-ignored
- Archive directory is excluded from scans

---

## 2) Content Validator (Node.js)

### Purpose

Enforce SoftFocus content invariants automatically:

- neutral, clinical tone
- no motivational or inspirational framing
- no urgency or sales language
- canonical terminology consistency
- strict pSEO structural templates
- audience-specific constraints where defined

### Why it matters

SoftFocus is assessment-driven.
Content drift directly destroys trust and SEO authority.

The validator makes drift **technically difficult**.

### Enforcement scope

- Local development (pre-commit)
- CI (merge and deploy gates)
- Offline readiness validation

---

## 3) Audience Coverage Checker (Node.js)

### Purpose

Verify that all declared audiences
are actually implemented as programmatic SEO pages.

### Why it matters

At scale it is easy to:
- miss audiences
- duplicate coverage unintentionally
- assume coverage that does not exist

This script turns SEO coverage into an auditable inventory.

---

## 4) Offline Deploy Readiness System (Critical)

### Purpose

Define and enforce what it formally means for the repository
to be **READY FOR DEPLOY**.

This system operates offline and precedes all CI and release logic.

### Key properties

- Linear execution
- Deterministic outcome
- Explicit failure states
- Promotion is manual and intentional

### Output states

- NOT READY
- READY WITH WARNINGS
- READY FOR DEPLOY

Only READY FOR DEPLOY authorizes promotion.

---

## 5) Linear Stage Runner

### Purpose

Execute all readiness checks as a **single linear protocol**:

1. Offline readiness validation
2. Architecture lock verification
3. Promotion to enforced gates (with human confirmation)
4. Release authorization binding
5. Machine-readable status generation

### Why linearity matters

- Prevents partial success
- Preserves causality
- Makes responsibility explicit
- Eliminates accidental promotion

There is exactly one valid execution order.

---

## 6) Architecture Locks

### Purpose

Protect Phase 1 and Phase A as immutable core logic.

### Design rule

Locked phases are not agreements.
They are mechanically enforced reference artifacts.

Any change requires:
- a new versioned document
- explicit re-locking

Silent mutation is forbidden.

---

## 7) Release Governance

### Purpose

Ensure that releases are:

- tag-based only
- authorized by readiness state
- reproducible and auditable

### Key rule

No release is possible unless:
- READY FOR DEPLOY is satisfied
- architecture locks are intact
- release is executed via the safe release entry point

---

## 8) Phase B / Phase C Freeze

### Purpose

Prevent premature expansion.

Localization, conversion, and SEO scaling
must not progress independently of system readiness.

### Enforcement

- Phase B and Phase C tooling must refuse to run
- Draft localized content is always noindex
- Promotion requires passing readiness again

---

## 9) Hard Rules (Non-Negotiable)

- Never commit secrets (real, test, or placeholder).
- Never store secrets in documentation.
- Never bypass readiness gates.
- Never modify locked phases in place.
- Programmatic SEO is distribution, not concept creation.

---

## Summary

Scripts in SoftFocus do not automate convenience.
They authorize state transitions.

Deploy is not an action.
Deploy is a consequence of permission.

