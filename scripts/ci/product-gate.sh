#!/usr/bin/env bash
set -euo pipefail

echo "[CI][PRODUCT-GATE] START"

ALIAS_BIN="./alias_softfocus/bin/alias-softfocus"

if [ ! -x "$ALIAS_BIN" ]; then
  echo "[CI][PRODUCT-GATE] FAIL: alias-softfocus not found or not executable"
  exit 1
fi

# --------------------------------------------------
# Phase D: executable CORE aliases only
# --------------------------------------------------
EXECUTABLE_CORE_ALIASES=(
  "bundle"
)

for alias in "${EXECUTABLE_CORE_ALIASES[@]}"; do
  echo "[CI][PRODUCT-GATE] Running alias: $alias"
  if ! "$ALIAS_BIN" "$alias"; then
    echo "[CI][PRODUCT-GATE] FAIL at alias: $alias"
    exit 1
  fi
done

echo "[CI][PRODUCT-GATE] PASS — PRODUCT READY (Phase D / Maintenance Mode)"
