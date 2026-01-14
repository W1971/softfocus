#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

REQUIRED=(
  docs/product/PHASE_A_STRUCTURED_PROTOCOL.md
  docs/product/PHASE_A_PROTOCOL_BREAKDOWN.md
  docs/product/PHASE_A_PAID_BOUNDARY_COPY.md
  docs/product/PHASE_A_PROTOCOL_UX_FLOW.md
)

echo "Running Stage A — Structured Protocol"

for f in "${REQUIRED[@]}"; do
  [ -f "$ROOT_DIR/$f" ] || { echo "BLOCKED: Missing $f"; exit 1; }
  echo "OK: Found $f"
done

echo "STAGE A PASSED"
