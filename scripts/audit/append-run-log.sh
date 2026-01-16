#!/usr/bin/env bash
set -euo pipefail

RUN_ID="$1"
MESSAGE="$2"

if [[ -z "$RUN_ID" || -z "$MESSAGE" ]]; then
  echo "Usage: append-run-log.sh <RUN_ID> <MESSAGE>"
  exit 1
fi

RUN_DIR="tests/runs/${RUN_ID}"
LOG_FILE="${RUN_DIR}/run.log"

mkdir -p "$RUN_DIR"

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

echo "[${TIMESTAMP}] ${MESSAGE}" >> "$LOG_FILE"
