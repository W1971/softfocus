#!/usr/bin/env bash
set -euo pipefail

RUN_ID="$1"
SCENARIO="$2"
CLASSIFICATION="$3"
OVERRIDE="$4"
RESULT="$5"
NOTES="${6:-}"

if [[ -z "$RUN_ID" || -z "$SCENARIO" || -z "$CLASSIFICATION" || -z "$OVERRIDE" || -z "$RESULT" ]]; then
  echo "Usage: append-audit-trail.sh <RUN_ID> <SCENARIO> <CLASSIFICATION> <OVERRIDE> <RESULT> [NOTES]"
  exit 1
fi

DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

echo "${DATE} | ${RUN_ID} | ${SCENARIO} | ${CLASSIFICATION} | ${OVERRIDE} | ${RESULT} | ${NOTES}" >> audit/AUDIT_TRAIL.md
