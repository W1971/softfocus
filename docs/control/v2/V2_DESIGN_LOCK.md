# V2 Design Lock Declaration

Status: ACTIVE  
Scope: SoftFocus v2  
Mode: DESIGN_ONLY  

---

## Declaration

SoftFocus v2 is formally locked in **DESIGN_ONLY** mode.

This means:

- v2 may exist as:
  - conceptual models
  - design briefs
  - analytical axes
  - visual language exploration

- v2 may NOT include:
  - frontend code
  - backend logic
  - UI flows
  - data schemas
  - runtime behavior

---

## Enforcement

Any document or script that:
- implies execution
- describes implementation
- references runtime components

is considered a **governance violation**.

---

## Unlock Conditions

Implementation may only begin if:

1. `V2_APPROVAL_GATE.md` is approved
2. CI gate `check-v2-governance.sh` passes
3. A release tag `v2.0.0-alpha` exists

Until then, v2 remains **non-executable by definition**.

