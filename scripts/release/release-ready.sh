#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — Release Ready Wrapper
# This script enforces the canonical, linear release readiness chain.
# No step may be skipped.
# Any failure results in immediate BLOCK.

ROOT_DIR="$(git rev-parse --show-toplevel)"
cd "$ROOT_DIR"

echo "[RELEASE] Starting release readiness sequence"

# ---- Step 1: Archive risky artifacts (non-destructive)
echo "[RELEASE] Step 1/4 — Archive script"
./scripts/archive/archive.sh
echo "[RELEASE] Step 1 PASSED"

# ---- Step 2: Content validation
echo "[RELEASE] Step 2/4 — Content validator"
node ./scripts/content-validator/validate-content.cjs
echo "[RELEASE] Step 2 PASSED"

# ---- Step 3: Audience coverage check
echo "[RELEASE] Step 3/4 — Audience coverage checker"
node ./scripts/audience-checker/check-audience-coverage.js
echo "[RELEASE] Step 3 PASSED"

# ---- Step 4: READY gate (final barrier)
echo "[RELEASE] Step 4/4 — READY gate"
./scripts/governance/ready-gate.sh
echo "[RELEASE] Step 4 PASSED"

echo "[RELEASE] RESULT: PASS"
echo "[RELEASE] Tagging is permitted"

exit 0
