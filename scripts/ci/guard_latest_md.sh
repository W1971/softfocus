#!/usr/bin/env bash
set -euo pipefail

# Only relevant for PRs
if [ -z "${GITHUB_BASE_REF:-}" ]; then
  echo "[INFO] Not a PR context, skipping latest.md guard"
  exit 0
fi

CHANGED="$(git diff --name-only "origin/${GITHUB_BASE_REF}"...HEAD)"

if echo "$CHANGED" | grep -q '^artifacts/bundles/latest.md$'; then
  echo "[FAIL] artifacts/bundles/latest.md must not be edited manually in PRs."
  echo "It is generated automatically by the bundle pipeline."
  exit 20
fi

echo "[OK] latest.md not modified manually"
