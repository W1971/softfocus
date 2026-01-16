#!/usr/bin/env bash
set -euo pipefail

SCENARIO_ID="TS-READY-BASE-001"
SCRIPT_NAME="$(basename "$0")"

RUN_ID="${1:-}"

if [[ -z "$RUN_ID" ]]; then
  echo "Usage: TS-READY-BASE-001.sh <RUN_ID>"
  exit 1
fi

LOG_TEXT="./scripts/audit/append-run-log.sh"
LOG_JSON="./scripts/audit/append-run-jsonl.sh"

# --- START ---
"$LOG_TEXT" "$RUN_ID" "START ${SCENARIO_ID}"

"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "bootstrap check" \
  "PASS" \
  "NONE" \
  "false"

"$LOG_TEXT" "$RUN_ID" "END ${SCENARIO_ID}"
