---
type: audit-checklist
stage: 2
scope: mobile-semantic-ui
mutability: restricted
---

# SoftFocus — Mobile Semantic UI Checklist (Stage-2)

## Purpose

Validate semantic correctness of mobile screens.

This checklist verifies that each screen performs
exactly one mental operation and introduces no
decision-making, guidance, or behavioral framing.

---

## Scope

Applies to:
- mobile/screens/**

Excludes:
- styling
- animation
- gestures
- navigation mechanics

---

## Checklist

### A. Screen Purpose Integrity

- [ ] Each screen has exactly one semantic purpose
- [ ] No screen mixes observation and interpretation
- [ ] No screen introduces choice or branching

FAIL if any item is unchecked.

---

### B. Archetype Compliance

- [ ] Assessment screens collect data only
- [ ] Result screens describe state only
- [ ] Reference screens explain meaning only
- [ ] Exit screens provide completion only

FAIL if any item is unchecked.

---

### C. Language Semantics

- [ ] No calls to action
- [ ] No advice or recommendations
- [ ] No “what next” framing
- [ ] Neutral, analytical language only

FAIL if any item is unchecked.

---

### D. Cognitive Load

- [ ] Screen can be understood without context
- [ ] No implied obligation to continue
- [ ] Completion is semantically sufficient

FAIL if any item is unchecked.

---

## Result

- PASS — semantic model is correct
- FAIL — semantic violations present

No exception process exists for Stage-2.
