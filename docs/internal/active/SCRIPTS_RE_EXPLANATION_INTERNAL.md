# SoftFocus — Scripts Re-Explanation (Internal)

This document explains **why each script exists**, what risks it prevents,
and how it supports a production-ready SoftFocus workflow.

Scripts are not helpers.  
They are **governance, safety, and release authority mechanisms**.

---

## 0) Core Principles

- Source of truth stays clean: only code + canonical docs in git.
- Noise is removable: builds, caches, logs, dependencies.
- Secrets never enter history.
- Validation is automated and repeatable.
- Scaling and distribution remain controlled.

---

## 1) Governance Scripts (Bash)

### Purpose
Enforce **phase integrity**, documentation parity, and structural invariants.

### What they protect
- Phase drift
- Silent documentation changes
- Semantic divergence between locales
- Unauthorized release transitions

### Examples
- structure-parity-check.sh
- indexing-guard.sh
- release-audit-check.sh

These scripts define **what is allowed to happen** in the system.

---

## 2) Archive Script (Bash)

### Purpose
Safely isolate files that must never be committed or released.

### What it protects
- Secret leakage
- Build artifact pollution
- Git history corruption

### Operational role
Pre-release and environment transitions.

---

## 3) Content Validator (Node.js)

### Purpose
Enforce SoftFocus content invariants:
- neutral, clinical tone;
- no urgency or persuasion;
- canonical terminology;
- pSEO structural constraints.

### Why it matters
SoftFocus trust collapses if meaning drifts.
Validator makes drift **technically difficult**.

---

## 4) Audience Coverage Checker (Node.js)

### Purpose
Turn audience coverage into a **verifiable inventory**.

### Why it matters
At scale, assumptions fail.
Coverage must be provable.

---

## 5) Release & Deployment Scripts

### Purpose
Gate releases before they become irreversible.

### What they protect
- Accidental production deploys
- Misconfigured environments
- Unauthorized indexing or distribution

### Key concept
A release is **authorized**, not just built.

---

## 6) Hard Rules (Non-Negotiable)

- Never commit secrets.
- Never bypass governance scripts.
- Never release without audit artifacts.
- Never allow undocumented indexing.
- Programmatic SEO is distribution, not content creation.

---

## Final Statement

Scripts are how SoftFocus **enforces correctness at scale**.
They are not conveniences.
They are the system’s immune response.
