#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/docs/architecture/active"

cat << 'DOC' > "$ROOT_DIR/docs/architecture/active/01_ARCHITECTURE_CONSTRAINTS_v1.0.md"
# SoftFocus — Architecture Constraints

Status: LOCKED  
Version: v1.0

---

## Purpose

This document defines non-negotiable architectural rules
for the SoftFocus repository.

These constraints exist to eliminate ambiguity,
human error, and silent degradation.

---

## Script Constraints

All automation scripts MUST:

- use only mkdir, cat, mv, cp, rm, chmod, test
- never modify files in place
- never parse or analyze file contents
- never depend on ordering or timestamps
- be reproducible and idempotent

Forbidden tools include:
- touch
- nano / vi
- sed / awk / grep
- patch
- diff

---

## Documentation Constraints

- Only docs/*/active is authoritative
- archive/ is write-only
- updates create new files, never edits
- version is encoded in filename
- only one active version per document

---

## Release Constraints

- releases are allowed only from git tags
- main branch is never a release source
- CI enforces release-from-tag

---

## Human-in-the-Loop Rule

Progression between stages requires
explicit human confirmation.

No stage auto-advances silently.

---

## Change Policy

This document is immutable.

Any change requires:
- a new versioned document
- explicit supersession
- manual review

DOC
