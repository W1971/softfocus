#!/usr/bin/env bash
set -e

echo "🔒 SoftFocus Release Gate"

# authorization check
if [ ! -f docs/governance/RELEASE_AUTHORIZED ]; then
  echo "❌ Release not authorized"
  exit 1
fi

echo "✔ Release authorized"

echo "→ Governance structure audit"
bash scripts/governance/structure-audit.sh

echo "→ Content rules validation"
npm run content:lint

echo "→ QA suites"
node tests/qa/runRecoveryQA.cjs

echo "✅ RELEASE GATE PASSED"
