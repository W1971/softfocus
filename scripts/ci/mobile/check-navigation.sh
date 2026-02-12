#!/usr/bin/env bash
set -euo pipefail

if grep -R "goBack\|navigateBack\|history.back" mobile >/dev/null 2>&1; then
  echo "❌ MOBILE FAIL: back-navigation detected"
  exit 1
fi

echo "✅ MOBILE navigation OK"
