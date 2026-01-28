#!/usr/bin/env bash
set -euo pipefail

echo "[AUDIT] Alias security audit started"

FAIL=0

for f in alias_softfocus/bin/*; do
  [ -f "$f" ] || continue

  echo "→ Auditing $(basename "$f")"

  grep -q "set -euo pipefail" "$f" || {
    echo "  FAIL: missing safe shell mode"
    FAIL=1
  }

  grep -q "BASH_SOURCE" "$f" || {
    echo "  WARN: no base directory resolution"
  }

  grep -q "DRY_RUN" "$f" || {
    echo "  WARN: no DRY_RUN support"
  }

done

if [ "$FAIL" = "1" ]; then
  echo "[AUDIT] FAILED"
  exit 1
fi

echo "[AUDIT] PASSED (with warnings allowed)"
