#!/usr/bin/env bash
set -euo pipefail

echo "🔒 Running MOBILE FAIL-FAST guards"

./scripts/ci/mobile/check-structure.sh
./scripts/ci/mobile/check-copy.sh
./scripts/ci/mobile/check-navigation.sh

echo "✅ ALL MOBILE GUARDS PASSED"
