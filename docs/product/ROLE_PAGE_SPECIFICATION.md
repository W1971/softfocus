## Non-Clinical Scope Declaration

This document operates strictly outside clinical, medical,
or therapeutic contexts and does not define diagnosis,
treatment, or mental health guidance.

## Scope
This specification is non-medical and non-clinical.

It governs distribution-layer role pages within the SoftFocus system
and does not define diagnostic criteria,
provide medical or psychological guidance,
or replace clinical assessment or care.

---
type: product-governance
boundary: non-clinical
---

# Role Page Specification

## Status
- Type: product-governance
- Scope: distribution layer
- Mutability: restricted (v1.x frozen)

## Purpose

Role pages exist to provide contextual entry points into the SoftFocus system
by describing role-specific load patterns without altering product logic.

They function as distribution overlays and do not introduce new assessments,
calculators, or recovery signal models.

## What a role page IS

A role page:
- describes a load context, not a persona
- frames burnout-risk-risk context in terms of cognitive, emotional, or decision load
- routes the user to an existing core assessment or calculator

## What a role page IS NOT

A role page is not:
- a standalone guide
- a recovery signal instruction
- a role-specific product
- a diagnostic or advisory resource

Role pages must not contain:
- recommendations
- action steps
- coping strategies
- motivational or emotional framing

## Structural requirements

Each role page MUST:
1. Reference exactly one core product
2. Use canonical terminology (burnout-risk, load, recovery signal-capacity signal)
3. Operate under an explicit non-clinical boundary
4. Avoid redefining system concepts

## Allowed variation

The only permitted variation across role pages is the description
of the role-specific load context.

All other structural and conceptual elements remain invariant.

## Indexing position

Role pages are indexable but non-canonical.
They are subordinate to core product pages and exist to route understanding,
not to accumulate authority.

## Governance rule

If a role page cannot be removed without affecting core products,
it violates system architecture.
