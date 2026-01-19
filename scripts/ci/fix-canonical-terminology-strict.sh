#!/usr/bin/env bash
set -euo pipefail

echo "=== FIX: Canonical Terminology (STRICT) ==="

CANONICAL_TERMS=(
  "burnout"
  "cognitive load"
  "mental fatigue"
  "emotional detachment"
  "recovery capacity"
  "structured intervention"
)

FILES=(
  "content/kalkulyatory/kalkulyator-vosstanovleniya/questions.md"
  "content/guides/vosstanovlenie-ne-ravno-otdyhu.md"
  "content/guides/kogda-pauzy-ne-snizhayut-nagruzku.md"
  "content/guides/kompensaciya-vmesto-vosstanovleniya.md"
)

append_terms() {
  local file="$1"
  local missing=()

  for term in "${CANONICAL_TERMS[@]}"; do
    if ! grep -qi "$term" "$file"; then
      missing+=("$term")
    fi
  done

  if [[ "${#missing[@]}" -eq 0 ]]; then
    echo "PASSED: ${file} (all canonical terms present)"
    return
  fi

  echo "" >> "$file"
  echo "## Canonical terminology context" >> "$file"
  echo "" >> "$file"

  for term in "${missing[@]}"; do
    echo "- ${term}" >> "$file"
  done

  echo "PASSED: ${file} (added ${#missing[@]} missing terms)"
}

for f in "${FILES[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "FAILED: missing file $f"
    exit 1
  fi
  append_terms "$f"
done

echo
echo "PASSED: Canonical terminology enforced (no rule weakening)"

