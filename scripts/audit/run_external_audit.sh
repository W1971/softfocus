#!/usr/bin/env bash
set -euo pipefail

# ================================
# SoftFocus External Audit Script
# v3 — artifact-aware
# Exit codes:
#   0  PASS
#   10 CONDITIONAL
#   20 FAIL
# ================================

FAILURES=0
WARNINGS=0

fail() {
  echo "[FAIL] $1"
  FAILURES=$((FAILURES+1))
}

warn() {
  echo "[WARN] $1"
  WARNINGS=$((WARNINGS+1))
}

info() {
  echo "[INFO] $1"
}

# Files to ignore (backup, temp, generated)
IGNORE_REGEX="\.bak$|\.tmp$|\.old$|/dist/|/build/"

# --------------------------------
# 0. Preconditions
# --------------------------------
info "Checking preconditions"

[ -f docs/overview.md ] || fail "docs/overview.md missing"
[ -f docs/PROJECT_DOCS_HIERARCHY.md ] || fail "PROJECT_DOCS_HIERARCHY.md missing"

# --------------------------------
# 1. Forbidden advisory / clinical language (UI zones only)
# --------------------------------
info "Scanning UI zones for forbidden advisory or clinical language"

UI_ZONES="frontend/components|frontend/adapters|frontend/content/calculators"
FORBIDDEN_UI_REGEX="рекомендуем|следует|нужно|стоит|полезен|оптимальн|лечен|терап|диагноз|совет"

grep -RniE "$FORBIDDEN_UI_REGEX" frontend \
  | grep -Ev "$IGNORE_REGEX" \
  | grep -E "$UI_ZONES" \
  && fail "Forbidden advisory or clinical language detected in UI zone"

# --------------------------------
# 2. Implicit value judgement (UI zones only)
# --------------------------------
info "Scanning UI zones for implicit value judgement"

VALUE_REGEX="(хорош|плох|низк|высок).{0,20}(восстанов|recovery)"

grep -RniE "$VALUE_REGEX" frontend \
  | grep -Ev "$IGNORE_REGEX" \
  | grep -E "$UI_ZONES" \
  && fail "Implicit value judgement detected in UI zone"

# --------------------------------
# 3. SEO / Guide zones — allowed but monitored
# --------------------------------
info "Scanning SEO / guide zones (non-blocking)"

SEO_REGEX="(хорош|плох|низк|высок).{0,20}(восстанов|recovery)"

grep -RniE "$SEO_REGEX" docs/frontend/content docs/guides 2>/dev/null \
  && warn "Value judgement present in SEO / guide content (allowed, review periodically)"

# --------------------------------
# 4. Canonical sources
# --------------------------------
info "Checking canonical sources"

[ -f docs/seo/SEO_ENTRY_INDEX.md ] || fail "SEO_ENTRY_INDEX.md missing"
[ -f docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md ] \
  || fail "Canonical explanations index missing"

# --------------------------------
# 5. Analytical axis lock
# --------------------------------
info "Checking frozen analytical axis"

grep -qi "burnout → recovery capacity → compensation" docs/overview.md \
  || fail "Canonical analytical axis missing or altered"

# --------------------------------
# 6. Scoring core immutability
# --------------------------------
info "Checking scoring core"

[ -f scripts/core/recovery/scoreRecovery.cjs ] \
  || fail "Scoring core missing"

[ -f docs/governance/RFC-RECOVERY-SCORING-v1.md ] \
  || fail "Scoring RFC missing"

# --------------------------------
# 7. Phase C governance
# --------------------------------
info "Checking Phase C RFC"

[ -f docs/governance/rfc/RFC-PHASE-C-MAINTENANCE.md ] \
  || fail "Phase C RFC missing"

# --------------------------------
# 8. Result
# --------------------------------
echo "--------------------------------"
echo "Audit summary:"
echo "  FAILURES: $FAILURES"
echo "  WARNINGS: $WARNINGS"
echo "--------------------------------"

if [ "$FAILURES" -gt 0 ]; then
  exit 20
elif [ "$WARNINGS" -gt 0 ]; then
  exit 10
else
  exit 0
fi
