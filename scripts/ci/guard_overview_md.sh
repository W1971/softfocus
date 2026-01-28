#!/usr/bin/env bash
set -euo pipefail

# Only relevant for PRs
if [ -z "${GITHUB_BASE_REF:-}" ]; then
  echo "[INFO] Not a PR context, skipping overview.md guard"
  exit 0
fi

CHANGED="$(git diff --name-only "origin/${GITHUB_BASE_REF}"...HEAD)"

if echo "$CHANGED" | grep -q '^docs/overview.md$'; then
  echo "[FAIL] docs/overview.md is canonical (Level 0) and requires governance approval."
  echo "Do not modify without explicit governance process."
  exit 20
fi

echo "[OK] docs/overview.md not modified in PR"
