#!/usr/bin/env bash
set -euo pipefail

echo "=== CREATE + CHECK: File Placement ==="

ROOT="$(pwd)"

create_file() {
  local path="$1"
  local content="$2"

  local full="${ROOT}/${path}"
  local dir
  dir="$(dirname "${full}")"

  mkdir -p "${dir}"

  cat <<EOF > "${full}"
${content}
EOF

  if [[ ! -f "${full}" ]]; then
    echo "FAILED: file not created -> ${path}"
    exit 1
  fi

  echo "PASSED: created ${path}"
}

# 1. Recovery calculator question set
create_file "content/kalkulyatory/kalkulyator-vosstanovleniya/questions.md" "\
# Recovery Calculator — Question Set
Version: v1.0
Status: LOCKED

1. In the past 14 days, how often have you completed a full workday without a meaningful recovery break?
2. How frequently do breaks fail to restore clarity or attention?
3. In the last two weeks, how often does work resume while mental load remains elevated?
4. How often are recovery periods shortened due to task pressure?
5. How frequently does rest feel compensatory rather than restorative?
6. How often do you rely on passive recovery instead of disengagement?
7. How frequently does cognitive clarity return later than expected after rest?
8. How often does sustained load carry over between days?
9. How often does recovery require explicit planning?
10. How frequently does workload stability depend on compensating strategies?
"

# 2. SEO guides
create_file "content/guides/vosstanovlenie-ne-ravno-otdyhu.md" "\
# Восстановление не равно отдыху

Пояснение, почему паузы не всегда закрывают восстановление
и как это отражается в калькуляторе восстановления.

Связанный инструмент:
/kalkulyator-vosstanovleniya
"

create_file "content/guides/kogda-pauzy-ne-snizhayut-nagruzku.md" "\
# Когда паузы не снижают нагрузку

Разбор условий, при которых перерывы создают иллюзию восстановления.

Связанный инструмент:
/kalkulyator-vosstanovleniya
"

create_file "content/guides/kompensaciya-vmesto-vosstanovleniya.md" "\
# Компенсация вместо восстановления

Как формируется компенсаторный режим
и почему он повышает риск деградации решений.

Связанный инструмент:
/kalkulyator-vosstanovleniya
"

# 3. Paid product scaffold
create_file "product/anti-burnout-system-30d/README.md" "\
# Anti-Burnout System — 30 Days
Version: v1.0
Status: DRAFT

Purpose:
Non-medical analytical system built on:
- Sleep Calculator
- Recovery Calculator
- Cognitive Load Assessment

Delivery:
Digital (PDF / Notion)
"

echo
echo "PASSED: All directories and files created correctly"

