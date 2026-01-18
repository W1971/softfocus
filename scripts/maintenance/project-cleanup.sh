#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-apply}" # apply | dry-run

echo "[PROJECT CLEANUP] SoftFocus"
echo "[MODE] $MODE"
echo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
cd "$REPO_ROOT"

TS="$(date -u +%Y%m%dT%H%M%SZ)"

MOVE() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" ]]; then
    return
  fi

  echo "[MOVE] $src -> $dst"

  if [[ "$MODE" == "apply" ]]; then
    mkdir -p "$(dirname "$dst")"
    mv "$src" "$dst"
  fi
}

# -------------------------------------------------
# 1. Archive obsolete architecture docs
# -------------------------------------------------
echo "[STEP] Architecture docs cleanup"

for f in docs/architecture/active/*.md; do
  [[ -e "$f" ]] || continue

  if grep -q "^Status: ARCHIVED" "$f"; then
    base="$(basename "$f")"
    MOVE "$f" "docs/architecture/archive/${TS}_${base}"
  fi
done

# -------------------------------------------------
# 2. Archive obsolete bootstrap scripts
# (delegates to canonical bootstrap archiver)
# -------------------------------------------------
if [[ -x scripts/archive/archive-obsolete-bootstrap.sh ]]; then
  echo
  echo "[STEP] Bootstrap archival"
  if [[ "$MODE" == "apply" ]]; then
    scripts/archive/archive-obsolete-bootstrap.sh
  else
    echo "[DRY-RUN] bootstrap archival would be executed"
  fi
fi

# -------------------------------------------------
# 3. Sanity check: forbidden execution artifacts
# -------------------------------------------------
echo
echo "[STEP] Sanity check"

if ls tests/runs/RUN-* 1>/dev/null 2>&1; then
  echo "[FAIL] Execution RUN artifacts present in repo"
  exit 1
fi

echo
echo "[PROJECT CLEANUP] Completed"
echo "[TIMESTAMP] $TS"

if [[ "$MODE" == "dry-run" ]]; then
  echo
  echo "[NOTE] Dry-run mode — no changes applied"
fi
