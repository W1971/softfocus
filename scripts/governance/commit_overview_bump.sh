#!/usr/bin/env bash
set -euo pipefail

# Ensure file changed
if git diff --quiet -- docs/overview.md; then
  echo "[FAIL] No changes detected in docs/overview.md"
  exit 20
fi

git add docs/overview.md
git commit -m "governance: bump overview version to v1.5.0"
echo "[OK] Governance commit created"
