# SoftFocus v1.0.0 — Operational Release

**Status:** OPERATIONAL  
**Phase:** B (Stabilization)  
**Date:** 2026-01-26

---

## Summary

SoftFocus v1.0.0 marks the transition from implementation and observation
to a stable operational state with deterministic readiness control.

All core analytical logic remains frozen.
This release focuses on execution correctness, UI stability,
and governance enforcement.

---

## What Is Included

### Governance & Control Plane
- Deterministic `generate-status v2`
- Mandatory RUN_ID for readiness evaluation
- FAIL-only semantics (no WARN allowed)
- Formal Operational Readiness declaration

### Analytical Core
- Recovery Scoring v1 confirmed frozen
- No changes to scoring logic or analytical axis
- Single source of truth preserved

### Frontend
- Calculator content normalized (RU / EN)
- Mobile result screens stabilized
- Strict type contracts enforced
- Successful production build without warnings

### Operations
- Auditable execution trail
- Maintenance and audit scaffolding
- Clear separation of artefacts vs source

---

## Explicitly Not Included

- No new analytical axes
- No adaptive or behavioral logic
- No scoring modifications
