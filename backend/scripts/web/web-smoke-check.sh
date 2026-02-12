#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:3000}"

echo "[WEB SMOKE] starting → $URL"

curl -sf "$URL/" > /dev/null
echo "[OK] /"

curl -sf "$URL/en/tests/burnout-test" > /dev/null
echo "[OK] /en/tests/burnout-test"

curl -sf "$URL/ru/tests/burnout-test" > /dev/null
echo "[OK] /ru/tests/burnout-test"

echo "[WEB SMOKE] passed"
