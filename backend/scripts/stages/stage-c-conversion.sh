#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

echo "Running Stage C — Conversion Layer"

[ -d "$ROOT_DIR/docs/seo/active" ] || { echo "BLOCKED: seo active/ missing"; exit 1; }
[ -d "$ROOT_DIR/docs/seo/archive" ] || { echo "BLOCKED: seo archive/ missing"; exit 1; }

echo "OK: SEO filing present"
echo "STAGE C PASSED"
