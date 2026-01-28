# Documentation Archive — SoftFocus

This directory contains **archived documentation**.

Archived documents are:
- historical
- superseded
- non-canonical
- preserved for traceability only

## Rules

- Files in `archive/docs/` **must not** be referenced by:
  - runtime code
  - CI checks
  - SEO indexes
  - active governance rules

- Moving a document here means:
  - it no longer defines system behavior
  - it no longer participates in validation
  - it is retained strictly for audit or history

## Source of Truth

All canonical and active documentation lives in:

- `docs/overview.md`
- `docs/control/`
- `docs/governance/`
- `docs/product/`
- `docs/seo/`

If a document is required for system correctness,
**it does not belong here**.

---

Archive is immutable by default.
