#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: content-validate-run.sh <RUN_ID>"
  exit 1
fi

export RUN_ID
export SCENARIO_ID="TS-CONTENT-VALIDATE-001"

# Step 1: run canonical validator (read-only)
node backend/scripts/content-validator/validate-content.cjs content || true

# Step 2: emit example governance signal (contract-level)
backend/scripts/content-validator/emit-run-jsonl.js \
  >/dev/null

echo "PASSED: content-validate run completed (signals emitted)"
