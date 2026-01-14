#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/docs/audit"

cat << 'AUDIT' > "$ROOT_DIR/docs/audit/AUDIT_LOG.md"
# SoftFocus — Audit Log

Status: ACTIVE  
Policy: APPEND-ONLY  

---

## Purpose

This log records significant lifecycle events:
- stage completions
- releases
- structural changes

Entries are appended manually or by CI.
Existing entries are never modified.

---

## Entries

AUDIT

echo "AUDIT_LOG.md created"
