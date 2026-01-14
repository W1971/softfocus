#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="deploy-preflight.log"
: > "$LOG_FILE"

log() { echo "[PRE-FLIGHT] $1" | tee -a "$LOG_FILE"; }
fail() { echo "[PRE-FLIGHT][FAIL] $1" | tee -a "$LOG_FILE"; exit 1; }
ok() { echo "[PRE-FLIGHT][OK] $1" | tee -a "$LOG_FILE"; }

log "Starting pre-flight checks"

git diff --quiet || fail "Uncommitted changes detected"
ok "Git working tree clean"

npm run content:lint >> "$LOG_FILE" 2>&1 || fail "Content validation failed"
ok "Content validation passed"

npm run build >> "$LOG_FILE" 2>&1 || fail "Build failed"
ok "Build passed"

[ -f next.config.cjs ] || fail "next.config.cjs missing"
[ ! -f next.config.js ] || fail "next.config.js must not exist"
ok "Next.js configuration valid"

log "Pre-flight checks completed successfully"
