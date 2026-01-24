#!/usr/bin/env bash
set -euo pipefail

RESULT="PASS"

# ---------------------------------------------------------------------------
# Forbidden directories (must never exist at repo root)
# ---------------------------------------------------------------------------
FORBIDDEN_DIRS=".wip .tmp .backup scratch logs node_modules"

for dir in $FORBIDDEN_DIRS; do
  if [ -d "$dir" ]; then
    echo "[STRUCTURE][FAIL] Forbidden directory present: $dir"
    RESULT="FAIL"
  fi
done

# ---------------------------------------------------------------------------
# Forbidden root log files (*.log)
# ---------------------------------------------------------------------------
if ls *.log >/dev/null 2>&1; then
  for f in *.log; do
    if [ -f "$f" ]; then
      echo "[STRUCTURE][FAIL] Log file committed at root: $f"
      RESULT="FAIL"
    fi
  done
fi

# ---------------------------------------------------------------------------
# Canonical top-level allowlist
# ---------------------------------------------------------------------------
ALLOWED_TOP_DIRS="
.github docs scripts tests audit
app backend frontend src pages public
content product alias_softfocus archive
"

ALLOWED_ROOT_FILES="
Makefile README.md SECURITY.md STATUS.md
package.json package-lock.json
tsconfig.json next.config.cjs next-env.d.ts
bootstrap-softfocus.sh product-manifesto.md
"

for entry in $(ls -1); do
  [ "$entry" = ".git" ] && continue

  if [ -d "$entry" ]; then
    allowed="no"
    for a in $ALLOWED_TOP_DIRS; do
      if [ "$entry" = "$a" ]; then
        allowed="yes"
        break
      fi
    done
    if [ "$allowed" = "no" ]; then
      echo "[STRUCTURE][FAIL] Top-level dir not allowed: $entry"
      RESULT="FAIL"
    fi

  elif [ -f "$entry" ]; then
    allowed="no"
    for f in $ALLOWED_ROOT_FILES; do
      if [ "$entry" = "$f" ]; then
        allowed="yes"
        break
      fi
    done
    if [ "$allowed" = "no" ]; then
      echo "[STRUCTURE][FAIL] Root file not allowed: $entry"
      RESULT="FAIL"
    fi
  fi
done

echo "audit_result=${RESULT}"
