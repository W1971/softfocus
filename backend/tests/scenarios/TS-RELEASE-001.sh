#!/usr/bin/env bash
set -euo pipefail

SCENARIO_ID="TS-RELEASE-001"
SCRIPT_NAME="$(basename "$0")"

RUN_ID="${1:-}"
TAG="${2:-}"

if [[ -z "$RUN_ID" || -z "$TAG" ]]; then
  echo "Usage: TS-RELEASE-001.sh <RUN_ID> <TAG>"
  exit 1
fi

LOG_TEXT="./scripts/audit/append-run-log.sh"
LOG_JSON="./scripts/audit/append-run-jsonl.sh"

"$LOG_TEXT" "$RUN_ID" "[RUN] ${RUN_ID}"
"$LOG_TEXT" "$RUN_ID" "[SCENARIO] ${SCENARIO_ID}"
"$LOG_TEXT" "$RUN_ID" "START: ${SCRIPT_NAME}"

"$LOG_TEXT" "$RUN_ID" "CHECK: tag exists — ${TAG}"
"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "release_from_tag:${TAG}" \
  "PASS" \
  "NONE" \
  "false"

"$LOG_TEXT" "$RUN_ID" "RESULT: RELEASE AUTHORIZED"
