---
type: status-map
scope: mobile-docs
status: canonical
phase: phase-d
mutability: frozen
last_verified_utc: 2026-02-03T00:00Z
---

# Mobile Documentation — Status Map

This document defines the **authoritative status**
of all documents under `docs/mobile/`.

Its purpose is to:
- eliminate ambiguity,
- prevent responsibility overlap,
- enable final implementation without documentation drift.

If a document is not listed here,
it has **no authority**.

---

## LEVEL 0 — CANONICAL TARGET (Single Source of Truth)

These documents define **what the mobile product is**.
All implementation decisions must align with them.

### Canonical
- `FINAL_MOBILE_SPEC.md`  
  **Role:** Final product target  
  **Authority:** Absolute  
  **Notes:**  
  - Defines the final mobile experience  
  - Overrides all other mobile documents in case of conflict  

---

## LEVEL 1 — PRODUCT BOUNDARIES (Hard Constraints)

These documents define **what mobile is allowed and forbidden to do**.

### Canonical
- `MOBILE_PRODUCT_SCOPE.md`  
  **Role:** Scope and responsibility boundaries

- `MOBILE_DISTRIBUTION_ENDPOINT.md`  
  **Role:** Terminal distribution semantics

- `control/MOBILE_FAIL_FAST_POLICY.md`  
  **Role:** Violation handling and fail semantics

---

## LEVEL 2 — VALIDATION & AUDIT (Enforcement Tools)

These documents do **not define product meaning**.
They verify compliance with Levels 0–1.

### Active (Validation)
- `MOBILE_INTERACTION_CHECKLIST.md`
- `MOBILE_SEMANTIC_UI_CHECKLIST.md`
- `MOBILE_VISUAL_LAYER_CHECKLIST.md`
- `qa/MOBILE_QA_CHECKLIST.md`
- `audit/*`
- `control/MOBILE_CODE_ALIGNMENT_CHECKLIST.md` (script-driven gate)

Authority:
- Validation only
- No meaning definition
- No UI expansion rights

---

## LEVEL 3 — DESIGN & HANDOFF (Reference Only)

These documents support **human handoff**
and must not define product truth.

### Reference
- `design/MOBILE_DESIGN_BRIEF.md`
- `design/MOBILE_DESIGN_HANDOFF_ONE_PAGER.md`
- `design/MOBILE_NO_NEW_SCREENS.md`
- `design/MOBILE_NO_EXTERNAL_UI.md`
- `design/MOBILE_TREE_CANON.md`

Rules:
- Must not contradict Levels 0–1
- Cannot introduce new screens or flows
- Cannot redefine semantics

---

## LEVEL 4 — HISTORICAL / ARCHIVE (Non-Active)

These documents are retained for traceability
but must not be used during implementation.

### Archive
- `MOBILE_PRODUCT_END_STATE.md`
- `MOBILE_PRODUCT_DESIGN_CONTRACT.md`
- `MOBILE_RESULT_CANON.md`
- `MOBILE_FLOW_OBJECT.md`
- `MOBILE_SCREEN_ARCHETYPES.md`
- `STAGE_4_DECLARATION.md`
- `STAGE_4_CALCULATORS_EXPOSURE.md`
- `VISUAL_FREEZE_STAGE_4.md`

Rules:
- Historical reference only
- No authority
- Must not be cited as active guidance

---

## Interpretation Rule (Hard)

If two documents conflict:

1. LEVEL 0 overrides everything
2. LEVEL 1 overrides Levels 2–4
3. LEVEL 2 never overrides meaning
4. LEVEL 3 never defines truth
5. LEVEL 4 is non-operative

Violations indicate documentation misuse.

---

## Final State

With this map in place:

- Mobile documentation is **closed and ordered**
- Implementation can proceed without ambiguity
- No new mobile documents are required

Any new mobile document requires:
- explicit level assignment
- justification
- governance approval

