#!/usr/bin/env bash
set -euo pipefail

# SoftFocus READY Gate
# v1.1 — governance enforced
# Purpose: final release confirmation point

echo "[GOVERNANCE] READY gate reached"

# --- Phase C Monetization Approval Gate ---

if [[ ! -f docs/control/phase-c/MONETIZATION_APPROVAL_RECORD.md ]]; then
  echo "[BLOCK] Monetization approval record not found"
  echo "[RELEASE STATUS] BLOCKED"
  exit 1
fi

if ! grep -q "status: APPROVED" docs/control/phase-c/MONETIZATION_APPROVAL_RECORD.md; then
  echo "[BLOCK] Monetization approval not confirmed"
  echo "[RELEASE STATUS] BLOCKED"
  exit 1
fi

# --- All checks passed ---

echo "[GOVERNANCE] All blocking conditions satisfied"
echo "[RELEASE STATUS] READY"

exit 0
