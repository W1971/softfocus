#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — Deployment Orchestrator
# Phase D compliant: Preflight -> Production gate
# No logic duplication. Order enforcement only.

echo "[DEPLOY] Starting deployment checks pipeline"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Step 1: Pre-flight checks ---
echo "[DEPLOY] Running pre-flight checks"
"$SCRIPT_DIR/deploy-preflight.sh"

# --- Step 2: Production checks (only if NODE_ENV=production) ---
if [[ "${NODE_ENV:-}" == "production" ]]; then
  echo "[DEPLOY] Running production checks"
  "$SCRIPT_DIR/deploy-production.sh"
else
  echo "[DEPLOY] NODE_ENV is not production — skipping production checks"
fi

echo "[DEPLOY] All deployment checks passed"
