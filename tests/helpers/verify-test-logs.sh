#!/usr/bin/env bash
set -euo pipefail

RUN_ID="$1"

if [ -z "$RUN_ID" ]; then
  echo "Usage: verify-test-logs.sh <RUN_ID>"
  exit 1
fi

RUN_DIR="tests/runs/$RUN_ID"

[ -f "$RUN_DIR/run.log" ] || {
  echo "❌ Missing run.log for $RUN_ID"
  exit 1
}

[ -f "$RUN_DIR/run.jsonl" ] || {
  echo "❌ Missing run.jsonl for $RUN_ID"
  exit 1
}

echo "✅ Test logs verified for $RUN_ID"
