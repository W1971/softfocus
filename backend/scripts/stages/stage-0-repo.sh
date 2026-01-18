#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"
cd "$ROOT_DIR"

echo "Running Stage 0 — Repository Integrity"

git diff --quiet || { echo "BLOCKED: Git working tree not clean"; exit 1; }
echo "OK: Git working tree clean"

npm run content:lint >/dev/null 2>&1 || { echo "BLOCKED: Content validation failed"; exit 1; }
echo "OK: Content validation passed"

npm run build >/dev/null 2>&1 || { echo "BLOCKED: Build failed"; exit 1; }
echo "OK: Build passed"

[ -f "$ROOT_DIR/next.config.cjs" ] || { echo "BLOCKED: next.config.cjs missing"; exit 1; }
echo "OK: Next.js config present"

echo "STAGE 0 PASSED"
