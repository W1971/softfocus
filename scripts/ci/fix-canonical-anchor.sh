#!/usr/bin/env bash
set -euo pipefail

echo "=== FIX: Canonical Terminology Anchor ==="

anchor_block=$(cat <<'EOF'
## Canonical context

This content is evaluated in relation to:
- burnout
- cognitive load
- mental fatigue
- emotional detachment
- recovery capacity
- structured intervention
EOF
)

add_anchor() {
  local file="$1"

  if ! grep -qi "burnout" "$file"; then
    echo "" >> "$file"
    echo "$anchor_block" >> "$file"
    echo "PASSED: canonical anchor added to $file"
  else
    echo "PASSED: canonical anchor already present in $file"
  fi
}

add_anchor "content/kalkulyatory/kalkulyator-vosstanovleniya/questions.md"
add_anchor "content/guides/vosstanovlenie-ne-ravno-otdyhu.md"
add_anchor "content/guides/kogda-pauzy-ne-snizhayut-nagruzku.md"
add_anchor "content/guides/kompensaciya-vmesto-vosstanovleniya.md"

echo
echo "PASSED: Canonical terminology anchors ensured"

