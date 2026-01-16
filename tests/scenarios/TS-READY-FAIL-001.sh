#!/usr/bin/env bash
set -euo pipefail

SCENARIO_ID="TS-READY-FAIL-001"
SCRIPT_NAME="$(basename "$0")"

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: TS-READY-FAIL-001.sh <RUN_ID>"
  exit 1
fi

LOG_TEXT="./scripts/audit/append-run-log.sh"
LOG_JSON="./scripts/audit/append-run-jsonl.sh"
CLASSIFY="./tests/helpers/ready-classify.sh"

STRUCTURAL_FAIL_COUNT=1
LOW_RISK_COUNT=0

"$LOG_TEXT" "$RUN_ID" "[RUN] ${RUN_ID}"
"$LOG_TEXT" "$RUN_ID" "[SCENARIO] ${SCENARIO_ID}"
"$LOG_TEXT" "$RUN_ID" "START: ${SCRIPT_NAME}"

"$LOG_TEXT" "$RUN_ID" "CHECK: architecture lock mismatch — FAIL (STRUCTURAL)"
"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "architecture_lock" \
  "FAIL" \
  "HIGH" \
  "false"

CLASSIFICATION="$("$CLASSIFY" "$STRUCTURAL_FAIL_COUNT" "$LOW_RISK_COUNT")"

"$LOG_TEXT" "$RUN_ID" "RESULT: ${CLASSIFICATION}"
"$LOG_TEXT" "$RUN_ID" "OVERRIDE: FORBIDDEN"

exit 0
