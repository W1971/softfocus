# SoftFocus — Audit Entry

This directory contains all materials required for
external or internal audit of SoftFocus (Phase C).

---

## Primary Audit Entry

### 1. Audit Handoff (Human-Readable)
- `AUDIT_HANDOFF.md`

This document explains:
- system scope and non-clinical boundaries
- canonical document precedence
- audit procedure and exit codes
- governance constraints

---

### 2. Generated Project Bundle (Machine-Traceable)
- `artifacts/bundles/latest.md`

This file:
- is generated automatically
- is timestamped (UTC)
- includes git metadata
- includes SHA256 checksum
- is the authoritative snapshot of project state

---

## Verification Order (Recommended)

1. Read `AUDIT_HANDOFF.md`
2. Open `artifacts/bundles/latest.md`
3. (Optional) Run `scripts/audit/run_external_audit.sh`
4. Compare results against baseline tag:
   - `phase-c-clean-baseline`

---

## Important Notes

- Do NOT edit generated artifacts manually
- All canonical meaning is defined by:
  - `docs/overview.md`
  - `docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md`
- SEO or guide content must not redefine meaning

