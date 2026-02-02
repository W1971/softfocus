#!/usr/bin/env bash
set -euo pipefail

echo "[RUNTIME] Enforcing runtime split (web / mobile / shared)"

violations=0

# -----------------------------------------
# Rules:
# app/mobile  -> docs/mobile/**
# app/web     -> docs/web/**
# app/shared  -> docs/product/**
# -----------------------------------------

check_violation() {
  local path="$1"
  local expected="$2"

  if ! grep -q "$expected" docs/product/runtime/RUNTIME_SPLIT.md; then
    echo "[VIOLATION] $path is not governed by $expected"
    violations=1
  fi
}

# -------- mobile --------
while IFS= read -r f; do
  check_violation "$f" "docs/mobile/"
done < <(git ls-files app/mobile || true)

# -------- web --------
while IFS= read -r f; do
  check_violation "$f" "docs/web/"
done < <(git ls-files app/web || true)

# -------- shared --------
while IFS= read -r f; do
  check_violation "$f" "docs/product/"
done < <(git ls-files app/shared || true)

if [ "$violations" -eq 1 ]; then
  echo "[RUNTIME] FAILED: runtime split violation detected"
  exit 1
fi

echo "[RUNTIME] PASS: runtime split enforced"
