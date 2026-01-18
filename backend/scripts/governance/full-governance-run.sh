#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------------
# SoftFocus — Full Governance Run (Single Command)
# -------------------------------------------------
#
# Usage:
#   ./scripts/governance/full-governance-run.sh base
#   ./scripts/governance/full-governance-run.sh low yes
#   ./scripts/governance/full-governance-run.sh fail
#   ./scripts/governance/full-governance-run.sh base release v1.0.0
#
# -------------------------------------------------

MODE="${1:-}"
HUMAN_DECISION="${2:-}"
RELEASE_TAG="${3:-}"

if [[ -z "$MODE" ]]; then
  echo "Usage:"
  echo "  base"
  echo "  low <yes|no>"
  echo "  fail"
  echo "  base release <TAG>"
  exit 1
fi

RUN_ID="RUN-$(date -u +%Y%m%dT%H%M%SZ)"
echo "[GOVERNANCE] RUN_ID=${RUN_ID}"

VERIFY="./tests/helpers/verify-test-logs.sh"
AUDIT="./scripts/audit/append-audit-trail.sh"
CI_GATE="./scripts/ci/governance-gate.sh"

# -------------------------------------------------
# MODE: BASE (READY)
# -------------------------------------------------
if [[ "$MODE" == "base" ]]; then
  ./tests/scenarios/TS-READY-BASE-010.sh "$RUN_ID"
fi

# -------------------------------------------------
# MODE: LOW RISK
# -------------------------------------------------
if [[ "$MODE" == "low" ]]; then
  if [[ "$HUMAN_DECISION" != "yes" && "$HUMAN_DECISION" != "no" ]]; then
    echo "[GOVERNANCE][FAIL] low mode requires yes|no"
    exit 1
  fi
  ./tests/scenarios/TS-READY-LOW-001.sh "$RUN_ID" "$HUMAN_DECISION"
fi

# -------------------------------------------------
# MODE: STRUCTURAL FAIL
# -------------------------------------------------
if [[ "$MODE" == "fail" ]]; then
  ./tests/scenarios/TS-READY-FAIL-001.sh "$RUN_ID"
fi

# -------------------------------------------------
# VERIFY LOGS
# -------------------------------------------------
"$VERIFY" "$RUN_ID"

# -------------------------------------------------
# Extract classification + override from logs
# -------------------------------------------------
JSONL="tests/runs/${RUN_ID}/run.jsonl"

CLASSIFICATION="$(grep "ready_classification" "$JSONL" | tail -n 1 | sed 's/.*ready_classification://')"
OVERRIDE="$(grep "human_override" "$JSONL" | tail -n 1 | sed 's/.*human_override://;s/}//')"

CLASSIFICATION="${CLASSIFICATION:-UNKNOWN}"
OVERRIDE="${OVERRIDE:-false}"

# -------------------------------------------------
# Append audit trail
# -------------------------------------------------
"$AUDIT" \
  "$RUN_ID" \
  "$MODE" \
  "$CLASSIFICATION" \
  "$OVERRIDE" \
  "PASS" \
  "full governance run"

# -------------------------------------------------
# CI GOVERNANCE GATE
# -------------------------------------------------
"$CI_GATE" "$RUN_ID"

# -------------------------------------------------
# OPTIONAL RELEASE
# -------------------------------------------------
if [[ "$MODE" == "base" && "$HUMAN_DECISION" == "release" ]]; then
  if [[ -z "$RELEASE_TAG" ]]; then
    echo "[RELEASE][FAIL] tag required"
    exit 1
  fi
  ./tests/scenarios/TS-RELEASE-001.sh "$RUN_ID" "$RELEASE_TAG"
fi

echo "[GOVERNANCE][DONE] RUN=${RUN_ID}"
