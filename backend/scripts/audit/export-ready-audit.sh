#!/usr/bin/env bash
set -euo pipefail

RUN_ID="$1"

if [[ -z "$RUN_ID" ]]; then
  echo "Usage: export-ready-audit.sh <RUN_ID>"
  exit 1
fi

JSONL="tests/runs/${RUN_ID}/run.jsonl"
OUT="audit/READY_AUDIT.jsonl"

if [[ ! -f "$JSONL" ]]; then
  echo "[AUDIT][FAIL] Missing run.jsonl for ${RUN_ID}"
  exit 1
fi

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

CLASSIFICATION="$(grep "ready_classification" "$JSONL" | tail -n 1 | sed 's/.*ready_classification://')"
OVERRIDE="$(grep "human_override" "$JSONL" | tail -n 1 | sed 's/.*human_override://;s/}//')"

CLASSIFICATION="${CLASSIFICATION:-UNKNOWN}"
OVERRIDE="${OVERRIDE:-false}"

cat << JSON >> "$OUT"
{"timestamp":"${TIMESTAMP}","run_id":"${RUN_ID}","classification":"${CLASSIFICATION}","human_override":${OVERRIDE}}
JSON

echo "[AUDIT] READY_AUDIT appended for ${RUN_ID}"
