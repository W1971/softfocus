#!/usr/bin/env bash
set -euo pipefail

echo "[STRUCTURE AUDIT] SoftFocus — pre-Phase-B check"
echo

FAIL=0

# -------------------------------------------------
# Ignore zones (not part of source of truth)
# -------------------------------------------------
IGNORE_DIRS=(
  "./.git"
  "./node_modules"
  "./.wip"
  "./archive"
)

should_ignore() {
  local path="$1"
  for ignore in "${IGNORE_DIRS[@]}"; do
    if [[ "$path" == "$ignore"* ]]; then
      return 0
    fi
  done
  return 1
}

# -------------------------------------------------
# 1. Forbidden directories (if tracked)
# -------------------------------------------------
FORBIDDEN_DIRS=(
  ".tmp"
  ".backup"
  "scratch"
  "logs"
)

for d in "${FORBIDDEN_DIRS[@]}"; do
  if [[ -d "$d" ]]; then
    echo "[FAIL] Forbidden directory present: $d"
    FAIL=1
  fi
done

# -------------------------------------------------
# 2. tests/runs policy
# -------------------------------------------------
if [[ -d "tests/runs" ]]; then
  for d in tests/runs/*; do
    base="$(basename "$d")"
    if [[ "$base" != "EXAMPLE_RUN_000" ]]; then
      echo "[FAIL] Execution RUN found in repo: tests/runs/$base"
      FAIL=1
    fi
  done
fi

# -------------------------------------------------
# 3. Script placement rules (source-owned only)
# -------------------------------------------------
while IFS= read -r script; do
  if should_ignore "$script"; then
    continue
  fi

  if [[ "$script" != ./scripts/* && "$script" != ./tests/* ]]; then
    echo "[FAIL] Shell script outside scripts/ or tests/: $script"
    FAIL=1
  fi
done < <(find . -type f -name '*.sh')

# -------------------------------------------------
# 4. Governance core presence
# -------------------------------------------------
REQUIRED_FILES=(
  "docs/governance/GOVERNANCE_LOCK_v1.1.md"
  "docs/governance/PROJECT_STRUCTURE_LOCK.md"
  "scripts/governance/full-governance-run.sh"
  "scripts/governance/structure-audit.sh"
  "tests/scenarios/TS-GOVERNANCE-SELF-001.sh"
  ".github/workflows/governance-self-test.yml"
  "SECURITY.md"
)

for f in "${REQUIRED_FILES[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "[FAIL] Missing required file: $f"
    FAIL=1
  fi
done

# -------------------------------------------------
# Result
# -------------------------------------------------
echo
if [[ "$FAIL" -eq 0 ]]; then
  echo "[PASS] Project structure is CLEAN and Phase-B-READY"
  exit 0
else
  echo "[BLOCKED] Structure violations detected"
  exit 1
fi
