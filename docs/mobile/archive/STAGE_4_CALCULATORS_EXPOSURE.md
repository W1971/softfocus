---
type: audit-checklist
stage: 4
scope: mobile-calculators
mutability: restricted
---

# SoftFocus — Stage-4 Calculators Exposure Checklist

## Purpose

This checklist validates **how calculators are exposed on mobile**.

It does not validate:
- scoring logic
- correctness of models
- analytical validity

It validates **visibility, positioning, and semantic role only**.

---

## Canonical Constraint

On mobile, calculators are **interpretation references**, not tools.

They must comply with **Archetype 3**.

---

## Allowed Exposure Patterns (Mobile)

### Pattern A — Direct Reference Entry

- calculator opens directly
- no introduction screen
- no setup
- no CTA

PASS if calculator behaves as static reference.

---

### Pattern B — Result-Bound Reference

- calculator is reachable only after result
- entry is implicit
- no invitation language

PASS if reference does not feel optional or promoted.

---

## Forbidden Exposure Patterns

- calculator listed as “tool”
- calculator promoted on home
- calculator framed as improvement mechanism
- calculator preceded by explanation “why you should use it”

Any of the above → **FAIL**

---

## Archetype 3 Compliance

Each calculator screen must:

- [ ] be scroll-only
- [ ] contain no configuration
- [ ] contain no calls to action
- [ ] contain no “next step” language
- [ ] allow immediate exit

FAIL if any item is unchecked.

---

## Visual Discipline (Stage-4)

- no hero treatment
- no emphasis hierarchy beyond typography rules
- no visual separation suggesting workflow

Calculators must feel **quiet and optional**.

---

## Result

- PASS — calculators are exposed as references
- FAIL — calculators feel like tools or products

No exception process exists.

---

## Declaration

This checklist is enforced at Stage-4 only.
It is advisory and must not block merge.

