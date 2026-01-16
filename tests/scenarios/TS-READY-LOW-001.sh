#!/usr/bin/env bash
set -euo pipefail

SCENARIO_ID="TS-READY-LOW-001"
SCRIPT_NAME="$(basename "$0")"

RUN_ID="${1:-}"
HUMAN_DECISION="${2:-}"

if [[ -z "$RUN_ID" || -z "$HUMAN_DECISION" ]]; then
  echo "Usage: TS-READY-LOW-001.sh <RUN_ID> <yes|no>"
  exit 1
fi

if [[ "$HUMAN_DECISION" != "yes" && "$HUMAN_DECISION" != "no" ]]; then
  echo "[GOVERNANCE][FAIL] human decision must be yes or no"
  exit 1
fi

LOG_TEXT="./scripts/audit/append-run-log.sh"
LOG_JSON="./scripts/audit/append-run-jsonl.sh"
CLASSIFY="./tests/helpers/ready-classify.sh"

STRUCTURAL_FAIL_COUNT=0
LOW_RISK_COUNT=1

"$LOG_TEXT" "$RUN_ID" "[RUN] ${RUN_ID}"
"$LOG_TEXT" "$RUN_ID" "[SCENARIO] ${SCENARIO_ID}"
"$LOG_TEXT" "$RUN_ID" "START: ${SCRIPT_NAME}"

"$LOG_TEXT" "$RUN_ID" "CHECK: git dirty — LOW RISK"
"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "git_dirty" \
  "FAIL" \
  "LOW" \
  "false"

CLASSIFICATION="$("$CLASSIFY" "$STRUCTURAL_FAIL_COUNT" "$LOW_RISK_COUNT")"

if [[ "$HUMAN_DECISION" == "no" ]]; then
  "$LOG_TEXT" "$RUN_ID" "HUMAN DECISION: NO"
  "$LOG_TEXT" "$RUN_ID" "RESULT: NOT READY"
  exit 0
fi

"$LOG_TEXT" "$RUN_ID" "HUMAN DECISION: YES (override accepted)"

"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "ready_classification:${CLASSIFICATION}" \
  "PASS" \
  "LOW" \
  "true"

"$LOG_TEXT" "$RUN_ID" "RESULT: READY FOR DEPLOY (LOW RISK OVERRIDE)"
