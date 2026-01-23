#!/usr/bin/env bash
set -euo pipefail

echo "== SoftFocus v1 — Operational Readiness Check =="

RUN_ID="${RUN_ID:-op-readiness-$(date +%Y%m%d-%H%M%S)}"
export RUN_ID

echo "[1/6] Content validation"
npm run content:lint

echo "[2/6] CI pre-product tests"
./scripts/ci/pre-product-tests.sh "$RUN_ID"

echo "[3/6] Audit smoke event (run.jsonl)"

export TARGET="operational-readiness"
export RULE="ENTITLEMENT_SMOKE"
export SEVERITY="PASS"
export RESULT="emitted"
export CONTENT_TYPE="governance"
export SCENARIO_ID="TS-OP-READINESS-001"

node backend/scripts/content-validator/emit-run-jsonl.js >/dev/null

RUN_DIR="tests/runs/$RUN_ID"
RUN_FILE="$RUN_DIR/run.jsonl"

if [ ! -f "$RUN_FILE" ]; then
  echo "ERROR: $RUN_FILE not found"
  exit 1
fi

echo "✔ audit record found at $RUN_FILE"

echo "[4/6] Alias status generation"
alias-softfocus list >/dev/null

echo "[5/6] Governance documents presence"
test -f docs/control/OPERATIONAL_READINESS.md
test -f docs/overview.md

echo "[6/6] No masked FAIL conditions"
if grep -R "FAIL" tests/runs/ 2>/dev/null | grep -v EXPECTED; then
  echo "ERROR: Unhandled FAIL detected"
  exit 1
fi

echo "== RESULT: SoftFocus v1 is eligible for operational readiness declaration =="
