# SoftFocus — External Audit Entry Point

This repository supports deterministic external audit.

## What SoftFocus Is
SoftFocus is a non-clinical analytical system that evaluates
whether recovery is closed under sustained cognitive load.

It does NOT provide:
- diagnosis
- recommendations
- behavioral guidance
- norms or targets

## Canonical Sources
Meaning is defined only by:

- docs/overview.md
- docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md

SEO, UI, and translations are non-authoritative.

## How to Run the Audit

```bash
scripts/audit/run_external_audit.sh
Exit codes:
0 — PASS
10 — CONDITIONAL (warnings only)
20 — FAIL (canonical or governance violation)
Audit Mode
Read-only
No build required
No runtime execution
Repository inspection only
Interpretation Rule
If audit results require explanation or justification,
the system must be considered unsafe.
This file is authoritative for auditors.

---

## Latest Canonical Bundle

Auditors should **always start here**:

- `artifacts/bundles/latest.md`

This file is:
- generated automatically
- updated on every CI run
- timestamped (UTC)
- protected from manual edits

If this file is missing or outdated, the audit must be considered invalid.
