#!/usr/bin/env bash
set -euo pipefail

BUNDLE_VERSION="Phase C (Maintenance)"
OUT="project_bundle.md"

echo "[RELEASE] Generating project bundle..."

cat > "$OUT" <<EOF2
# SoftFocus — Project Bundle

**Version:** $BUNDLE_VERSION  
**Generated:** $(date -u +"%Y-%m-%d")

---

## Canonical Entry
docs/overview.md

## Documentation Structure
docs/PROJECT_DOCS_HIERARCHY.md
docs/PROJECT_DOCUMENTATION_OVERVIEW.md

## SEO & Public Entry
docs/seo/SEO_ENTRY_INDEX.md
docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md

## Product Core
docs/product/CANONICAL_THEORY_OF_OPERATION.md
docs/product/assessment-model.md
docs/product/assessment-results.md

## Governance
docs/control/
docs/governance/
docs/governance/invariants/PHASE_C_MAINTENANCE.md

---

Status: Phase C / Maintenance
EOF2

echo "[RELEASE] Bundle generated: $OUT"
