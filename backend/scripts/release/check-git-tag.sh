#!/usr/bin/env bash
set -euo pipefail

CURRENT_TAG=$(git describe --tags --exact-match 2>/dev/null || true)

if [ -z "$CURRENT_TAG" ]; then
  echo "[RELEASE][FAIL] Deployment is allowed only from a git tag"
  exit 1
fi

echo "[RELEASE][OK] Git tag detected: $CURRENT_TAG"
