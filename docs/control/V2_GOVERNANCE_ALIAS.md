# Alias: v2-design-check

Purpose:
Enforce v2 governance as DESIGN_ONLY.

Guarantees:
- No implementation language
- No runtime targets
- Explicit DESIGN_ONLY declaration

Status:
READY

Scope:
- docs/
- docs/roadmap
- docs/control

CI:
- required

Failure mode:
- HARD FAIL (blocks CI, blocks release)
