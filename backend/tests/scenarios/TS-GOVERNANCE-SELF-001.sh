#!/usr/bin/env bash
set -euo pipefail

SCENARIO_ID="TS-GOVERNANCE-SELF-001"
SCRIPT_NAME="$(basename "$0")"

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: TS-GOVERNANCE-SELF-001.sh <RUN_ID>"
  exit 1
fi

LOG_TEXT="./scripts/audit/append-run-log.sh"
LOG_JSON="./scripts/audit/append-run-jsonl.sh"

"$LOG_TEXT" "$RUN_ID" "[RUN] ${RUN_ID}"
"$LOG_TEXT" "$RUN_ID" "[SCENARIO] ${SCENARIO_ID}"
"$LOG_TEXT" "$RUN_ID" "START: ${SCRIPT_NAME}"

# -------------------------------------------------
# Check 1: Canonical documents exist
# -------------------------------------------------
DOCS=(
  "docs/governance/TEST_GOVERNANCE.md"
  "docs/governance/GOVERNANCE_TERMS.md"
  "docs/governance/READY_CLASSIFICATION.md"
  "docs/governance/GOVERNANCE_ENTRYPOINT.md"
  "docs/governance/RISK_ESCALATION_POLICY.md"
)

for doc in "${DOCS[@]}"; do
  if [[ ! -f "$doc" ]]; then
    "$LOG_TEXT" "$RUN_ID" "CHECK: missing ${doc} — FAIL"
    exit 1
  fi
  "$LOG_TEXT" "$RUN_ID" "CHECK: ${doc} — PASS"
done

# -------------------------------------------------
# Check 2: Canonical entry point exists
# -------------------------------------------------
ENTRYPOINT="scripts/governance/full-governance-run.sh"
if [[ ! -x "$ENTRYPOINT" ]]; then
  "$LOG_TEXT" "$RUN_ID" "CHECK: governance entry point — FAIL"
  exit 1
fi

"$LOG_TEXT" "$RUN_ID" "CHECK: governance entry point — PASS"

# -------------------------------------------------
# Check 3: Full governance run executes
# -------------------------------------------------
"$LOG_TEXT" "$RUN_ID" "CHECK: executing full governance run — START"

./scripts/governance/full-governance-run.sh base

"$LOG_TEXT" "$RUN_ID" "CHECK: full governance run — PASS"

# -------------------------------------------------
# Check 4: CI governance gate executable
# -------------------------------------------------
if [[ ! -x "scripts/ci/governance-gate.sh" ]]; then
  "$LOG_TEXT" "$RUN_ID" "CHECK: CI governance gate — FAIL"
  exit 1
fi

"$LOG_TEXT" "$RUN_ID" "CHECK: CI governance gate — PASS"

# -------------------------------------------------
# Check 5: Audit trail exists
# -------------------------------------------------
if [[ ! -f "audit/AUDIT_TRAIL.md" ]]; then
  "$LOG_TEXT" "$RUN_ID" "CHECK: audit trail — FAIL"
  exit 1
fi

"$LOG_TEXT" "$RUN_ID" "CHECK: audit trail — PASS"

# -------------------------------------------------
# Final result
# -------------------------------------------------
"$LOG_TEXT" "$RUN_ID" "RESULT: GOVERNANCE SELF-TEST PASSED"

"$LOG_JSON" \
  "$RUN_ID" \
  "$SCENARIO_ID" \
  "$SCRIPT_NAME" \
  "governance_self_test" \
  "PASS" \
  "NONE" \
  "false"
