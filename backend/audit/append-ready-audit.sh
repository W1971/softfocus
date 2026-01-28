#!/usr/bin/env bash
set -euo pipefail

AUDIT="backend/audit/READY_GATE.audit.jsonl"

cat << EOL >> "$AUDIT"
{"event":"READY_GATE","timestamp":"$(date -Is)","result":"READY","phase":"C"}
EOL
