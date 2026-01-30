#!/usr/bin/env bash

set -e

PHASES=(
  "PHASE 0 — Canonical Assumptions"
  "PHASE 1 — pSEO Content Audit"
  "PHASE 2 — UX Flow Lock"
  "PHASE 3 — Universal pSEO Template"
  "PHASE 4 — Calculator Alignment Audit"
  "PHASE 5 — Canonical Test Results Page"
  "PHASE 6 — UI Copy Review"
  "PHASE 7 — Operational Readiness v1"
  "PHASE 8 — Phase B Decision Tree"
)

DOCS=(
  "docs/execution/PHASE_0_ASSUMPTIONS.md"
  "docs/execution/PHASE_1_PSEO_AUDIT.md"
  "docs/execution/PHASE_2_UX_FLOW.md"
  "docs/execution/PHASE_3_PSEO_TEMPLATE.md"
  "docs/execution/PHASE_4_CALCULATOR_AUDIT.md"
  "docs/execution/PHASE_5_RESULTS_PAGE.md"
  "docs/execution/PHASE_6_UI_COPY.md"
  "docs/execution/PHASE_7_OPERATIONAL_READINESS.md"
  "docs/execution/PHASE_8_PHASE_B_DECISION_TREE.md"
)

STATUS_FILE="docs/execution/EXECUTION_STATUS.txt"

echo "SoftFocus — Execution Control"
echo "============================="
echo

touch "$STATUS_FILE"

LAST_COMPLETED=$(grep -E "^COMPLETED:" "$STATUS_FILE" | tail -n 1 | cut -d':' -f2 | xargs)

START_INDEX=0

if [[ -n "$LAST_COMPLETED" ]]; then
  for i in "${!PHASES[@]}"; do
    if [[ "${PHASES[$i]}" == "$LAST_COMPLETED" ]]; then
      START_INDEX=$((i + 1))
    fi
  done
fi

for i in "${!PHASES[@]}"; do
  if [[ $i -lt $START_INDEX ]]; then
    continue
  fi

  echo
  echo "--------------------------------------------"
  echo "Current phase:"
  echo "  ${PHASES[$i]}"
  echo
  echo "Reference document:"
  echo "  ${DOCS[$i]}"
  echo
  echo "Have you completed this phase according to the document?"
  echo -n "Type YES to confirm, or NO to stop: "
  read ANSWER

  if [[ "$ANSWER" == "YES" ]]; then
    echo "COMPLETED:${PHASES[$i]}" >> "$STATUS_FILE"
    echo "Phase confirmed as completed."
    continue
  else
    echo
    echo "Execution stopped."
    echo "Complete the phase before proceeding."
    exit 0
  fi
done

echo
echo "============================================"
echo "All phases completed."
echo "SoftFocus execution plan is fully finished."
echo "============================================"
