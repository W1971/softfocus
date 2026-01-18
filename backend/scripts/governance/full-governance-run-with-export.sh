#!/usr/bin/env bash
set -euo pipefail

./scripts/governance/full-governance-run.sh "$@"

# extract last RUN_ID from stdout is fragile → recompute safely
RUN_ID="$(ls -td tests/runs/RUN-* | head -n 1 | xargs basename)"

./scripts/audit/export-ready-audit.sh "$RUN_ID"
