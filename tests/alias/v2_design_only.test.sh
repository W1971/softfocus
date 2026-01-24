#!/usr/bin/env bash
set -euo pipefail

echo "== v2 DESIGN_ONLY alias test =="

./scripts/ci/check-v2-design-only.sh

echo "✔ v2 DESIGN_ONLY enforced"
