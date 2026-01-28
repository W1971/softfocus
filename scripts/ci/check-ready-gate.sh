#!/usr/bin/env bash
set -euo pipefail

backend/scripts/governance/ready-gate.sh \
  || { echo "FAIL: READY gate blocked"; exit 1; }

echo "READY gate PASSED"
