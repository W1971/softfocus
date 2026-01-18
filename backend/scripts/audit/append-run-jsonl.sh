#!/usr/bin/env bash
set -euo pipefail

RUN_ID="$1"
SCENARIO_ID="$2"
SCRIPT="$3"
CHECK="$4"
RESULT="$5"
RISK="$6"
HUMAN_OVERRIDE="$7"

if [[ -z "$RUN_ID" || -z "$SCENARIO_ID" || -z "$SCRIPT" || -z "$CHECK" || -z "$RESULT" || -z "$RISK" || -z "$HUMAN_OVERRIDE" ]]; then
  echo "Usage: append-run-jsonl.sh <RUN_ID> <SCENARIO_ID> <SCRIPT> <CHECK> <RESULT> <RISK> <HUMAN_OVERRIDE>"
  exit 1
fi

RUN_DIR="tests/runs/${RUN_ID}"
JSONL_FILE="${RUN_DIR}/run.jsonl"

mkdir -p "$RUN_DIR"

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

cat << JSON >> "$JSONL_FILE"
{"timestamp":"${TIMESTAMP}","run_id":"${RUN_ID}","scenario_id":"${SCENARIO_ID}","script":"${SCRIPT}","check":"${CHECK}","result":"${RESULT}","risk":"${RISK}","human_override":${HUMAN_OVERRIDE}}
JSON
