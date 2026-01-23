---
type: audit-checklist
scope: mobile-ui
mutability: active
---

# SoftFocus — Mobile UI Audit Checklist

## Purpose

This checklist is used to evaluate existing mobile UI
against SoftFocus mobile governance documents.

It defines **pass / fail conditions**, not opinions.

---

## Reference Documents (Mandatory)

- docs/mobile/MOBILE_PRODUCT_DESIGN_CONTRACT.md
- docs/mobile/MOBILE_UI_INTERACTION_RULES.md
- docs/mobile/MOBILE_SCREEN_ARCHETYPES.md
- docs/product/PRODUCT_PHILOSOPHY_CONTRACT.md

---

## Audit Scope

Applies to:

- assessment screens
- result screens
- interpretation screens
- navigation elements

---

## Checklist

### A. Surface Simplicity

- [ ] Each screen answers exactly one question
- [ ] No screen requires user decision-making
- [ ] No configuration or preferences exposed
- [ ] No onboarding or explanatory overlays

FAIL if any item is unchecked.

---

### B. Visual Restraint

- [ ] No decorative UI elements
- [ ] No attention-grabbing colors
- [ ] No visual competition between elements
- [ ] Sufficient negative space present

FAIL if any item is unchecked.

---

### C. Interaction Economy

- [ ] Zero or one tap per screen
- [ ] No progress indicators
- [ ] No micro-interactions for engagement
- [ ] Exit is always unblocked

FAIL if any item is unchecked.

---

### D. Language Discipline

- [ ] No motivational language
- [ ] No reassurance or encouragement
- [ ] No urgency framing
- [ ] Neutral, analytical tone only

FAIL if any item is unchecked.

---

### E. Completion Signal

- [ ] Result screen feels complete
- [ ] No implied “next step”
- [ ] No loop back suggestion
- [ ] User can leave without friction

FAIL if any item is unchecked.

---

## Audit Result

- PASS — Mobile UI complies with SoftFocus philosophy
- FAIL — Violations must be removed, not justified

---

## Enforcement Note

Any FAIL blocks mobile release in v1.x.
No exception process exists.

---

## Audit Execution

Date: 2026-01-23  
Audited by: Product / Governance  
Artifact: Mobile v1 — Result Orientation Screen (current)

Result: PASS

Notes:

- No onboarding present
- No progress indicators
- Result screen does not imply next action
- Exit feels complete


---

