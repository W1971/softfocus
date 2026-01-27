#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: content-validate <RUN_ID>"
  exit 1
fi

export RUN_ID
export SCENARIO_ID="TS-CONTENT-VALIDATE-001"

# Step 1: run validator (read-only)
node backend/scripts/content-validator/validate-content.cjs content || true

# Step 2: emit readiness evidence UNDER THE SAME RUN_ID
node backend/scripts/content-validator/emit-run-jsonl.js

echo "[content-validate] PASS (RUN_ID=$RUN_ID)"
