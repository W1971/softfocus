#!/usr/bin/env bash
set -euo pipefail

STRUCTURAL_FAIL_COUNT="${1:-}"
LOW_RISK_COUNT="${2:-}"

if [[ -z "$STRUCTURAL_FAIL_COUNT" || -z "$LOW_RISK_COUNT" ]]; then
  echo "Usage: ready-classify.sh <STRUCTURAL_FAIL_COUNT:int> <LOW_RISK_COUNT:int>"
  exit 1
fi

if ! [[ "$STRUCTURAL_FAIL_COUNT" =~ ^[0-9]+$ ]]; then
  echo "[GOVERNANCE][FAIL] STRUCTURAL_FAIL_COUNT must be integer"
  exit 1
fi

if ! [[ "$LOW_RISK_COUNT" =~ ^[0-9]+$ ]]; then
  echo "[GOVERNANCE][FAIL] LOW_RISK_COUNT must be integer"
  exit 1
fi

if (( STRUCTURAL_FAIL_COUNT > 0 )); then
  echo "STRUCTURAL FAIL"
  exit 0
fi

if (( LOW_RISK_COUNT > 0 )); then
  echo "LOW RISK"
  exit 0
fi

echo "READY FOR DEPLOY"
