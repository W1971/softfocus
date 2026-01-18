# SoftFocus — Architecture (v1.0)

## Overview

SoftFocus is structured as a single repository with a clear separation
between frontend runtime, backend automation, and a root control plane.

The guiding principle is:
**operate the project by meaning, not by file paths.**

---

## High-level Layout

```text
softfocus/
├── src/ , app/ , public/        # Frontend (Next.js runtime)
├── next.config.cjs
├── package.json
│
├── backend/                     # Backend automation domain
│   ├── scripts/
│   ├── tests/
│   └── audit/
│
├── alias_softfocus/             # Root control plane
│   ├── bin/
│   ├── status/
│   └── VERSION
│
├── docs/                        # Project documentation
│   ├── ARCHITECTURE.md
│   └── CI.md
│
└── STATUS.md
Domains
Frontend
Next.js application
Lives in repository root
Own lifecycle (npm, build, test)
Backend
Operational scripts and pipelines
Test scenarios and validation
Produces run artifacts and statuses
Control Plane (alias_softfocus)
Stable, meaning-based commands
Orchestrates backend and frontend
Used by both humans and CI
Alias Status Policy
Only meaning-bearing backend aliases generate automatic .status
files derived from test runs (run.jsonl).
Infrastructure, orchestration, and utility aliases may remain in
UNKNOWN state by design.
Automatically classified
project-clean
content-validate
pipeline-check
Manually classified (optional)
backend-check
project-check
Intentionally UNKNOWN
frontend-build
frontend-test
export-report
generate-status
ci-gateHuman / CI
  → root alias_softfocus/bin/*
    → backend alias (if applicable)
      → backend/scripts/*
Versioning
This document describes Architecture v1.0.
Future structural changes must:
update this document
preserve alias semantics
avoid breaking user-facing commands
