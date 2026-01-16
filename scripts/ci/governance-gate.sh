#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: governance-gate.sh <RUN_ID>"
  exit 1
fi

JSONL="tests/runs/${RUN_ID}/run.jsonl"

if ! grep -q "READY FOR DEPLOY" "$JSONL"; then
  echo "[CI][BLOCKED] READY FOR DEPLOY not satisfied"
  exit 1
fi

echo "[CI][PASS] Governance gate satisfied"
