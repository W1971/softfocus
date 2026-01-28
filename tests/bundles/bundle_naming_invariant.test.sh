#!/usr/bin/env bash
set -euo pipefail

echo "[TEST] Bundle naming invariant (v-prefixed)"

TMP_DIR="$(mktemp -d)"
cp -r . "$TMP_DIR/repo"
cd "$TMP_DIR/repo"

# Clean bundles dir to avoid false positives
rm -rf artifacts/bundles
mkdir -p artifacts/bundles

# Run generator
scripts/bundles/generate_project_bundle.sh

# Assert: at least one v-prefixed bundle exists
if ! ls artifacts/bundles/project_bundle_v*.md >/dev/null 2>&1; then
  echo "[FAIL] No v-prefixed bundle produced"
  exit 1
fi

# Assert: no non-v bundle exists
if ls artifacts/bundles/project_bundle_[0-9]*_*.md >/dev/null 2>&1; then
  echo "[FAIL] Non-v bundle detected (violates naming invariant)"
  ls -1 artifacts/bundles
  exit 1
fi

echo "[PASS] Only v-prefixed bundle names present"
rm -rf "$TMP_DIR"
