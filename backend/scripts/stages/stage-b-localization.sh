#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

echo "Running Stage B — Localization"

[ -d "$ROOT_DIR/docs/product/active" ] || { echo "BLOCKED: product active/ missing"; exit 1; }
[ -d "$ROOT_DIR/docs/product/archive" ] || { echo "BLOCKED: product archive/ missing"; exit 1; }

echo "OK: Filing system present"
echo "STAGE B PASSED"
