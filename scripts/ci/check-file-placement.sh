#!/usr/bin/env bash
set -euo pipefail

echo "=== CHECK: File Placement Map ==="

ROOT="$(pwd)"

check_file() {
  local path="$1"
  local desc="$2"

  local full="${ROOT}/${path}"
  local dir
  dir="$(dirname "${full}")"

  if [[ ! -d "${dir}" ]]; then
    echo "FAILED: directory missing -> ${dir}"
    exit 1
  fi

  if [[ ! -f "${full}" ]]; then
    echo "FAILED: file missing -> ${path}"
    exit 1
  fi

  echo "PASSED: ${path} (${desc})"
}

check_file "content/kalkulyatory/kalkulyator-vosstanovleniya/questions.md" "Recovery Calculator question set"
check_file "content/guides/vosstanovlenie-ne-ravno-otdyhu.md" "Recovery SEO guide"
check_file "content/guides/kogda-pauzy-ne-snizhayut-nagruzku.md" "Recovery SEO guide"
check_file "content/guides/kompensaciya-vmesto-vosstanovleniya.md" "Recovery SEO guide"
check_file "product/anti-burnout-system-30d/README.md" "Paid product scaffold"

echo
echo "=== DIRECTORY INTENT SUMMARY ==="
echo "content/kalkulyatory/           -> product-grade calculators"
echo "content/guides/                -> SEO + analytical explainers"
echo "product/                       -> monetized digital products"
echo
echo "PASSED: File placement is correct"

