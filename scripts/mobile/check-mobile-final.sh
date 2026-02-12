#!/usr/bin/env bash
set -euo pipefail

# =========================================
# SoftFocus — Mobile Final Alignment Check
# Type: DESIGN GATE
# Mode: YES / NO → PASS / FAIL
# Target: FINAL_MOBILE_SPEC
# =========================================

FAIL=0

echo "== SoftFocus Mobile Final Check =="
echo

# -----------------------------------------
# A. ResultOrientationScreen
# -----------------------------------------

echo "[A] ResultOrientationScreen"

FILE_RESULT="moBILE/screens/result/ResultOrientationScreen.tsx"

if [[ ! -f "$FILE_RESULT" ]]; then
  echo "FAIL: ResultOrientationScreen.tsx not found"
  echo "NEXT: create the canonical result screen file"
  FAIL=1
else
  echo "OK: ResultOrientationScreen.tsx exists"
fi

# Check for buttons / CTA
if grep -E "Button|Touchable|Pressable|onPress" -q "$FILE_RESULT"; then
  echo "FAIL: Interactive elements detected in ResultOrientationScreen"
  echo "NEXT: remove all buttons and interaction handlers"
  FAIL=1
else
  echo "OK: No interactive UI detected"
fi

echo

# -----------------------------------------
# B. ResultText semantics
# -----------------------------------------

echo "[B] ResultText semantics"

FILE_TEXT="moBILE/components/text/ResultText.tsx"

if [[ ! -f "$FILE_TEXT" ]]; then
  echo "FAIL: ResultText.tsx not found"
  echo "NEXT: define canonical result text component"
  FAIL=1
else
  echo "OK: ResultText.tsx exists"
fi

# Forbidden language
if grep -Ei "you |your |should |try |improve |optimi|recommend" -q "$FILE_TEXT"; then
  echo "FAIL: Advisory or personalized language detected"
  echo "NEXT: rewrite text to be declarative and system-level"
  FAIL=1
else
  echo "OK: No advisory language detected"
fi

echo

# -----------------------------------------
# C. ScreenContainer visual rules
# -----------------------------------------

echo "[C] ScreenContainer visual rules"

FILE_CONTAINER="moBILE/components/layout/ScreenContainer.tsx"

if [[ ! -f "$FILE_CONTAINER" ]]; then
  echo "FAIL: ScreenContainer.tsx not found"
  echo "NEXT: create minimal visual container"
  FAIL=1
else
  echo "OK: ScreenContainer.tsx exists"
fi

# Animations check
if grep -Ei "animate|transition|motion" -q "$FILE_CONTAINER"; then
  echo "FAIL: Animations detected in ScreenContainer"
  echo "NEXT: remove all animation and motion logic"
  FAIL=1
else
  echo "OK: No animations detected"
fi

echo

# -----------------------------------------
# D. Navigation sanity
# -----------------------------------------

echo "[D] Navigation sanity"

FILE_NAV="moBILE/navigation/MobileNavigator.tsx"

if [[ -f "$FILE_NAV" ]]; then
  if grep -Ei "ResultOrientation.*->" -q "$FILE_NAV"; then
    echo "FAIL: Result screen routes to another screen"
    echo "NEXT: make ResultOrientationScreen terminal"
    FAIL=1
  else
    echo "OK: Result screen appears terminal"
  fi
else
  echo "OK: No explicit navigation file (acceptable)"
fi

echo

# -----------------------------------------
# FINAL RESULT
# -----------------------------------------

if [[ "$FAIL" -eq 0 ]]; then
  echo "================================="
  echo "PASS: Mobile implementation aligns with FINAL_MOBILE_SPEC"
  echo
  echo "NEXT STEP:"
  echo "- Proceed to docs/mobile status map (canonical / reference / archive)"
  echo "- Freeze mobile semantics"
  echo "================================="
  exit 0
else
  echo "================================="
  echo "FAIL: Mobile implementation violates FINAL_MOBILE_SPEC"
  echo
  echo "REQUIRED ACTION:"
  echo "- Fix the issues listed above"
  echo "- Re-run this script until PASS"
  echo "================================="
  exit 1
fi
