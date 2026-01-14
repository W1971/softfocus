#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/docs/architecture"

cat << 'INDEX' > "$ROOT_DIR/docs/architecture/SCRIPT_INDEX.md"
# SoftFocus — Script Index & Explanation

Version: v1.0  
Scope: Automation Architecture  

---

## Purpose

This document explains the role of each automation script
in the SoftFocus repository.

Scripts are designed to:
- eliminate human error
- enforce architectural contracts
- provide deterministic progression

---

## Bootstrap Scripts

### bootstrap-stages-v2.sh
Creates all stage scripts and runners.
This is the entry point for stage automation.

---

### bootstrap-docs-filing-v1.sh
Initializes the documentation filing system:
`active/` and `archive/`.

---

### bootstrap-release-manifest-v1.sh
Creates a declarative release contract.
No logic is embedded.

---

### bootstrap-audit-log-v1.sh
Creates the append-only audit log.

---

### bootstrap-docs-manifest-v1.sh
Creates a machine-readable declaration
of documentation domains and rules.

---

### bootstrap-self-check-v1.sh
Creates a repository self-check script
to verify RULE compliance.

---

## Runners

### stage-runner-linear.sh
Interactive, human-in-the-loop execution.
Requires explicit confirmation between stages.

---

### stage-runner-auto.sh
Non-interactive runner for CI.
Fails fast, no prompts.

---

## Design Principles

- Scripts never modify files in place
- New state is created, old state is archived
- Meaning is reviewed by humans
- Structure is enforced by machines

---

## Final Note

If a task requires manual editing,
it does not belong in automation.

INDEX

echo "SCRIPT_INDEX.md created"
