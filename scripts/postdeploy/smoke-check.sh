#!/usr/bin/env bash
set -euo pipefail

echo "[SMOKE] Starting post-deploy checks"

REQUIRED_ENDPOINTS=(
  "/"
  "/en/burnout-test-for-developers"
  "/api/health"
)

for endpoint in "${REQUIRED_ENDPOINTS[@]}"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL$endpoint")
  if [ "$STATUS" != "200" ]; then
    echo "[SMOKE][FAIL] $endpoint returned $STATUS"
    exit 1
  fi
  echo "[SMOKE][OK] $endpoint"
done

echo "[SMOKE] All smoke checks passed"
