#!/usr/bin/env bash
set -euo pipefail

echo "=== FIX: Content Frontmatter + Canonical Terms ==="

fix_file() {
  local path="$1"
  local frontmatter="$2"
  local body="$3"

  local dir
  dir="$(dirname "${path}")"

  mkdir -p "${dir}"

  cat <<EOF > "${path}"
${frontmatter}

${body}
EOF

  if [[ ! -f "${path}" ]]; then
    echo "FAILED: could not write ${path}"
    exit 1
  fi

  echo "PASSED: fixed ${path}"
}

# 1. Recovery calculator questions
fix_file "content/kalkulyatory/kalkulyator-vosstanovleniya/questions.md" \
"---
title: \"Recovery Calculator — Question Set\"
type: \"calculator\"
locale: \"ru-RU\"
path: \"/kalkulyator-vosstanovleniya\"
intent: \"high\"
tone: \"analytical\"
disclaimer: \"non-medical\"
---" \
"# Recovery Calculator — Question Set

This question set evaluates recovery capacity under sustained cognitive load
and identifies early signals of burnout risk caused by insufficient recovery.

Canonical context:
- cognitive load
- recovery capacity
- mental fatigue
- burnout

1. In the past 14 days, how often have you completed a full workday without a meaningful recovery break?
2. How frequently do breaks fail to restore clarity or attention?
3. In the last two weeks, how often does work resume while mental fatigue remains elevated?
4. How often are recovery periods shortened due to task pressure?
5. How frequently does rest function as compensation rather than recovery?
6. How often do you rely on passive recovery instead of disengagement?
7. How frequently does cognitive clarity return later than expected after rest?
8. How often does sustained cognitive load carry over between days?
9. How often does recovery require explicit planning?
10. How frequently does workload stability depend on compensating strategies?"

# 2. Guides
fix_file "content/guides/vosstanovlenie-ne-ravno-otdyhu.md" \
"---
title: \"Восстановление не равно отдыху\"
type: \"guide\"
locale: \"ru-RU\"
path: \"/guides/vosstanovlenie-ne-ravno-otdyhu\"
intent: \"medium\"
tone: \"analytical\"
---" \
"# Восстановление не равно отдыху

Восстановление и отдых не эквивалентны при высокой когнитивной нагрузке.
Недостаточная recovery capacity увеличивает риск burnout даже при наличии пауз.

Ключевые понятия:
- cognitive load
- recovery capacity
- mental fatigue
- burnout"

fix_file "content/guides/kogda-pauzy-ne-snizhayut-nagruzku.md" \
"---
title: \"Когда паузы не снижают нагрузку\"
type: \"guide\"
locale: \"ru-RU\"
path: \"/guides/kogda-pauzy-ne-snizhayut-nagruzku\"
intent: \"medium\"
tone: \"analytical\"
---" \
"# Когда паузы не снижают нагрузку

Паузы могут не снижать cognitive load, если они используются как компенсация,
а не как восстановление recovery capacity.

Связанные риски:
- mental fatigue
- burnout"

fix_file "content/guides/kompensaciya-vmesto-vosstanovleniya.md" \
"---
title: \"Компенсация вместо восстановления\"
type: \"guide\"
locale: \"ru-RU\"
path: \"/guides/kompensaciya-vmesto-vosstanovleniya\"
intent: \"medium\"
tone: \"analytical\"
---" \
"# Компенсация вместо восстановления

Компенсация когнитивной нагрузки маскирует снижение recovery capacity
и ускоряет формирование burnout как операционного риска.

Ключевые термины:
- cognitive load
- recovery capacity
- burnout"

echo
echo "PASSED: Content frontmatter and canonical terms fixed"

