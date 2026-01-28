# RFC: Phase C — Maintenance & Controlled Extension

**RFC ID:** RFC-PHASE-C-MAINTENANCE  
**Status:** DRAFT  
**Applies To:** SoftFocus v1.x  
**Author:** SoftFocus Governance  
**Created:** YYYY-MM-DD  
**Reviewers:** Governance Council  
**Effective After:** Formal approval + version bump

---

## 1. Purpose

This RFC defines **Phase C (Maintenance)** as the operational mode for SoftFocus v1.x.

Phase C exists to:
- preserve semantic integrity
- prevent analytical drift
- allow limited surface-level evolution
- keep the system auditable and deterministic

Phase C is a **protective phase**, not a growth phase.

---

## 2. Scope

This RFC governs:
- all changes made after formal declaration of Phase C
- interpretation of allowed vs forbidden modifications
- escalation rules for changes exceeding Phase C scope

This RFC does **not** introduce new product logic.

---

## 3. Canonical Product Axis (Immutable)

The following analytical axis is **frozen and immutable** for all v1.x releases:

> **burnout → recovery capacity → compensation**

Rules:
- no new analytical axes may be introduced
- no re-interpretation of existing terms is permitted
- no soft re-framing through UI, copy, or SEO is allowed

Any attempt to modify this axis requires:
- a new major version (v2)
- a separate RFC
- explicit governance approval

---

## 4. Non-Goals (Explicitly Forbidden)

Phase C does **not** allow:

- changes to scoring logic
- changes to interpretation logic
- adaptive or personalized behavior
- recommendations, advice, or norms
- clinical or therapeutic framing
- behavioral nudging or coaching flows
- hidden heuristics introduced via UI
- meaning changes introduced via translation

If a change introduces *any* of the above, it is out of scope.

---

## 5. Allowed Change Classes

The following change classes are allowed under Phase C:

### 5.1 Language & Localization
- translation of existing content
- locale-specific copy adjustments
- RTL / LTR UI adaptations

Rules:
- RU canonical meaning remains authoritative
- translations are derivative, not interpretive

---

### 5.2 SEO & Discovery Surface
- new SEO guides consistent with canonical explanations
- internal linking adjustments
- metadata and structural SEO changes

Rules:
- SEO content may introduce questions, not definitions
- canonical explanations override all SEO interpretations

---

### 5.3 UI & Presentation
- visual clarity improvements
- layout refinements
- accessibility improvements
- performance optimizations

Rules:
- UI remains a pure consumer of analytical output
- no UI-level logic or interpretation is permitted

---

### 5.4 Delivery & Entitlement Mechanics
- entitlement delivery optimization
- audit logging improvements
- operational tooling improvements

Rules:
- no impact on analytical meaning
- no silent entitlement behavior

---

## 6. Governance Severity Model (Phase C)

| Change Type | Severity | Requires RFC | Blocks CI |
|------------|----------|--------------|-----------|
| Scoring logic | FAIL | Yes (v2) | Yes |
| Interpretation logic | FAIL | Yes (v2) | Yes |
| UI clarity | PASS | No | No |
| SEO guide | WARN | No | No |
| Translation | PASS | No | No |
| New analytical axis | FAIL | Yes (v2) | Yes |

FAIL severity changes are **not allowed** in Phase C.

---

## 7. RFC Escalation Rules

A change must escalate beyond Phase C if it:

- introduces new analytical concepts
- modifies existing definitions
- changes how users interpret scores
- affects recovery / compensation semantics
- increases regulatory or clinical risk

Escalation path:
1. Mark change as out-of-scope
2. Draft v2 exploratory RFC
3. Suspend implementation until approval

---

## 8. Audit & Risk Impact

Phase C maintains:
- identical analytical risk profile as Phase B
- unchanged non-clinical positioning
- deterministic and auditable behavior

No additional user risk is introduced.

All Phase C changes must remain:
- reversible
- traceable
- explainable

---

## 9. Operational Declaration

Phase C is considered active only after:

- this RFC is approved
- a version bump is issued
- operational readiness is declared
- CI rules reflect Phase C constraints

Until then, Phase B governance remains authoritative.

---

## 10. Exit Conditions

Phase C ends only if:

- a v2 analytical direction is approved
- or SoftFocus v1 is formally sunset

Absent these conditions, Phase C may remain indefinitely.

---

## Summary

Phase C is a **meaning-preservation regime**.

It exists to ensure that SoftFocus v1 remains:
- stable
- auditable
- interpretable
- resistant to semantic drift

No feature, metric, or growth goal overrides this constraint.


---

## Appendix A — Accepted WARN Classes (Phase C)

The following WARN-level findings are explicitly accepted
and do not block release in Phase C:

- Value judgement terminology in SEO or guide content
  (e.g. "низкая восстановляемость"),
  provided that:
  - it does not appear in UI zones
  - it does not redefine canonical meaning
  - canonical explanations remain authoritative

These WARNs serve as review signals only.

