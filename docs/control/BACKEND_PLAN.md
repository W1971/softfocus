# Backend / Control Plan — Status and Next Steps

## Scope
Backend (control-plane) includes:
- scripts
- CI / pre-commit
- alias system
- validation and guards
- execution orchestration

This document fixes completed work and defines further backend evolution.

---

## ✅ Completed (v1.0)

### Control-plane
- Root architecture stabilized
- Frontend / Backend / Business separated
- Documentation treated as first-class artifact

### Alias System
- `alias-softfocus` dispatcher implemented
- Subcommands: list, run, docs, explain, doctor
- Docs navigation: overview, tree, search
- Status system wired (READY / UNKNOWN / etc.)

### CI & Quality Gates
- `alias-softfocus docs` as CI smoke-test
- Docs link checker implemented
- Pre-commit enforces docs integrity
- Content validation integrated

### Scripts & Automation
- Legacy scripts archived
- Backend scripts relocated under backend/
- Execution rules clarified (DRY_RUN supported)

---

## 🔒 Frozen Decisions

- No script runs without alias entry
- No commit without docs passing
- Backend does not own content or product decisions
- Control-plane is minimal and auditable

---

## ⏭ Further Plan (v1.1+)

### Short-term
- Status auto-generation from test runs
- Alias command classification enforcement
- Better error reporting for doctor

### Mid-term
- Dependency graph for scripts
- Script-level permission model
- CI enforcement by alias status (READY only)

### Long-term
- Full execution DAG
- Audit log per alias execution
- Release automation via control-plane only

---

## Ownership
Backend / control-plane is owned by:
- engineering
- maintainers

Changes require:
- architecture update
- CI green
- explicit status update
