#!/usr/bin/env bash
set -euo pipefail

echo "[CI][STAGE-BUNDLE] START"

# --------------------------------------------------
# 1. Generate canonical bundle
# --------------------------------------------------
scripts/bundles/generate_project_bundle.sh

# --------------------------------------------------
# 2. Freshness guard
# --------------------------------------------------
scripts/ci/guards/bundle-freshness-guard.sh

# --------------------------------------------------
# 3. Structural diff guard
# --------------------------------------------------
scripts/ci/guards/bundle-diff-guard.sh

echo "[CI][STAGE-BUNDLE] PASS"
