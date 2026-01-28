# RFC: Bundle Naming Invariant

**RFC ID:** RFC-BUNDLE-NAMING-INVARIANT  
**Status:** DRAFT  
**Applies To:** SoftFocus v1.x (Phase C)  
**Author:** SoftFocus Governance  
**Created:** YYYY-MM-DD  
**Reviewers:** Governance Council  
**Severity:** FAIL (violation blocks CI and release)

---

## 1. Purpose

This RFC defines a deterministic naming invariant for all generated
project bundles in SoftFocus.

The goal is:
- prevent multiple naming formats from co-existing
- ensure stable audit entry points
- guarantee predictable CI artifacts

---

## 2. Invariant (Normative)

All generated project bundles MUST use the following filename format:

> `project_bundle_v<SEMVER>_<YYYY-MM-DD>.md`

Rules:
- the version MUST be prefixed with `v`
- the date MUST be UTC in `YYYY-MM-DD`
- only one bundle per (version, date) is permitted

Examples:
- `project_bundle_v1.5.0_2026-01-28.md` ✅
- `project_bundle_1.5.0_2026-01-28.md` ❌ (missing `v`)

---

## 3. Canonical Pointer

A single canonical entry pointer MUST exist:

- `artifacts/bundles/latest.md`

Rules:
- it MUST be updated on each bundle generation
- it MUST include UTC timestamp metadata
- it MUST NOT be manually edited in PRs

---

## 4. Enforcement

Violations result in:
- severity: FAIL
- CI block
- release block

Enforcement mechanism:
- bundle generator MUST normalize version to `v<SEMVER>`
- unit test MUST assert only the canonical filename exists
- CI guard MUST prevent manual edits of `latest.md`

---

## 5. Relationship to Other RFCs

This RFC:
- complements `RFC-PHASE-C-MAINTENANCE`
- complements `RFC-UI-LANGUAGE-PROHIBITION`
- does not modify product logic

In case of conflict:
- stricter constraint applies

---

## Summary

Bundle naming is an audit-critical invariant.
Multiple naming formats are treated as governance failures.

