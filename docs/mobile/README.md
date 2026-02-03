---
type: index
scope: mobile-docs
status: canonical
phase: phase-d
mutability: frozen
last_verified_utc: 2026-02-03T00:00Z
---

# Mobile Documentation — Canonical Tree

This directory is organized by **document authority level**.
Physical file locations may differ for historical reasons.
**Authority is defined ONLY by this index.**

---

## /canonical — Final Product Targets (LEVEL 0)

Authoritative definition of what the mobile product IS.

- ../FINAL_MOBILE_SPEC.md

---

## /contracts — Hard Product Boundaries (LEVEL 1)

Documents defining what mobile is allowed or forbidden to do.

- ../MOBILE_PRODUCT_SCOPE.md
- ../MOBILE_DISTRIBUTION_ENDPOINT.md
- ../control/MOBILE_FAIL_FAST_POLICY.md

---

## /validation — Enforcement & Audit (LEVEL 2)

Checklists, scripts, and audits.
These documents NEVER define meaning.

- ../MOBILE_INTERACTION_CHECKLIST.md
- ../MOBILE_SEMANTIC_UI_CHECKLIST.md
- ../MOBILE_VISUAL_LAYER_CHECKLIST.md
- ../qa/MOBILE_QA_CHECKLIST.md
- ../audit/*
- ../control/MOBILE_CODE_ALIGNMENT_CHECKLIST.md

---

## /reference — Design & Handoff (LEVEL 3)

Human-facing reference material.
Not authoritative.

- ../design/MOBILE_DESIGN_BRIEF.md
- ../design/MOBILE_DESIGN_HANDOFF_ONE_PAGER.md
- ../design/MOBILE_NO_NEW_SCREENS.md
- ../design/MOBILE_NO_EXTERNAL_UI.md
- ../design/MOBILE_TREE_CANON.md

---

## /archive — Historical / Non-Active (LEVEL 4)

Retained for traceability only.
Must not be used during implementation.

- ../MOBILE_PRODUCT_END_STATE.md
- ../MOBILE_PRODUCT_DESIGN_CONTRACT.md
- ../MOBILE_RESULT_CANON.md
- ../MOBILE_FLOW_OBJECT.md
- ../MOBILE_SCREEN_ARCHETYPES.md
- ../STAGE_4_DECLARATION.md
- ../STAGE_4_CALCULATORS_EXPOSURE.md
- ../VISUAL_FREEZE_STAGE_4.md

---

## Interpretation Rule

If two documents conflict:
- /canonical overrides everything
- /contracts override validation, reference, archive
- /validation enforces, never defines
- /reference never defines truth
- /archive has zero authority

