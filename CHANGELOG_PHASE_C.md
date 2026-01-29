# SoftFocus — CHANGELOG (Phase C)

**Phase:** C  
**Mode:** Maintenance / Governance-Enforced  
**Baseline Tag:** `phase-c-clean-baseline`

---

## 1. Summary

Phase C establishes SoftFocus v1.x as an operational, audit-ready asset with:
- deterministic audit pipeline
- canonical documentation precedence
- strict UI language prohibition (projection-only UI)
- bundle-based external audit entry point
- CI enforcement and guards for audit-critical surfaces

No changes were introduced to analytical scoring logic or the canonical axis.

---

## 2. Scope and Non-Goals

### In Scope (Phase C)
- governance hardening
- deterministic documentation bundling
- audit enforcement scripts
- CI gates and guardrails
- archival hygiene

### Explicit Non-Goals
- no scoring logic changes
- no new analytical axes
- no UI interpretation layer
- no recommendations, coaching, or norms
- no monetization activation in Phase C

---

## 3. Governance Additions

### RFCs Added
- `RFC-PHASE-C-MAINTENANCE.md`
- `RFC-UI-LANGUAGE-PROHIBITION.md`
- `RFC-BUNDLE-NAMING-INVARIANT.md`

### Invariants / Policies Added
- documentation scope and separation rules
- SEO vs canonical meaning separation
- audit entry and enforcement boundaries

---

## 4. Audit Pipeline

### External Audit Script
- deterministic repository inspection with strict exit codes:
  - PASS (0)
  - CONDITIONAL (10)
  - FAIL (20)

### Artifact Hygiene
- cleanup script to remove backup artifacts that may pollute audit scans

---

## 5. Documentation Bundling

### Bundle Generator
- canonical-first ordering (`docs/overview.md` first)
- git metadata captured in bundle header
- UTC timestamp included
- SHA256 checksum included (integrity)

### Canonical Entry Pointer
- `artifacts/bundles/latest.md` is generated automatically
- protected from manual PR edits by CI guards

---

## 6. CI Enforcement

### Mandatory Bundle Job
- bundle generation required in CI
- ensures `latest.md` exists and is updated

### Guards
- prevent manual edits of audit-critical generated artifacts in PRs
- protect canonical entry surfaces from drift

### Diff Signal
- CI produces a diff signal between latest bundle and previous bundle
- non-blocking, audit-informative

---

## 7. Cleanup and Scope Control

### Paid Scope
- paid product documentation removed from active Phase C scope
- ensures maintenance mode does not leak monetization semantics

---

## 8. Baseline

The Phase C baseline for audits and comparisons is:
- tag: `phase-c-clean-baseline`

This tag marks a clean, audit-ready repository state.

