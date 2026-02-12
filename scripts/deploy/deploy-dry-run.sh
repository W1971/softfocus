#!/usr/bin/env bash
set -euo pipefail

echo "[DEPLOY][DRY-RUN] START"

./scripts/ci/stages/stage-bundle.sh

echo "[DEPLOY][DRY-RUN] Bundle validated"
echo "[DEPLOY][DRY-RUN] No infrastructure actions executed"

echo "[DEPLOY][DRY-RUN] PASS"
