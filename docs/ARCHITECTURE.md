# SoftFocus — Architecture

## Intent

SoftFocus is structured as a mono-repo with explicit domain boundaries:
- `backend/` (core logic, scripts, tests)
- `frontend/` (UI/client)
- `alias_softfocus/` at repo root (control-plane / orchestration)

The primary architectural goal is **operability by meaning**, not by file paths.
Stable commands (aliases) must remain consistent even when implementations move.

---

## Repository Layout

```text
softfocus/
├── backend/
│   ├── scripts/
│   ├── tests/
│   ├── alias_softfocus/          # backend-level command surface
│   ├── docs/
│   └── README.md
│
├── frontend/                     # UI domain (added/maintained independently)
│   ├── src/
│   ├── tests/
│   ├── package.json
│   └── README.md
│
├── alias_softfocus/              # ROOT control-plane (orchestrates domains)
│   ├── bin/
│   └── README.md
│
├── docs/
│   ├── ARCHITECTURE.md
│   └── CI.md
│
└── README.md

Domains of Responsibility
Backend (backend/)
Backend contains implementation and verification assets:
scripts/ — operational scripts and lifecycle tooling
tests/ — scenario verification and logging contract checks
alias_softfocus/ — backend command surface (meaning-based wrappers)
docs/ — backend-specific documentation
Backend must not depend on frontend artifacts.
Frontend (frontend/)
Frontend contains UI/client assets and its own build/test toolchain.
Frontend must not depend on backend internals.
Root Control Plane (alias_softfocus/)
Root control-plane provides a stable entry-point to run meaningful commands across domains.
It is intentionally thin and must not contain business logic.
Alias System (Control Plane)
Aliases are real executables, versioned in the repo.
They exist to provide:
discoverability (commands by meaning)
stable UX over time
uniform DRY_RUN behavior
execution blocking for unsafe states (e.g., FAIL)
CI parity (CI runs the same commands as humans)
Invariants
Aliases are not imported by application code.
Aliases are thin wrappers (orchestration only).
Aliases are stable identifiers; script paths may change.
Alias status is derived from test outputs, not manually invented.Human / CI
  ↓
root alias_softfocus/bin/*
  ↓
domain command surface (backend alias_softfocus, frontend npm)
  ↓
implementation (scripts, node, etc.)
  ↓
artifacts (run.log, run.jsonl, status files)
Status & Classification
Backend produces test artifacts (e.g. run.jsonl).
A derived .status file communicates:
READY — safe to run
LOW_CONFIDENCE — allowed locally but CI may block
FAIL — execution must be blocked
Root and backend aliases must respect these states.
Scaling Model
This structure supports growth:
additional domains (workers, mobile, infra) can be added as siblings of backend/ and frontend/
root control-plane can orchestrate them without coupling domains to each other
Guiding Principle
Implementation changes are temporary.
Meaning-based commands are permanent.
