# SoftFocus — Scripts Inventory (As-Is)

**Status:** READ-ONLY  
**Source:** repository tree inspection  
**Rule:** no execution, no modification

---

## Inventory Table

| Path | Type | Primary Role | Used In | Notes |
|-----|------|--------------|--------|-------|
| scripts/archive/archive.sh | bash | Safety | manual | canonical archive candidate |
| scripts/archive/archive-obsolete-bootstrap.sh | bash | Historical | none | bootstrap-era legacy |
| scripts/audience-checker/check-audience-coverage.js | node | Distribution | manual/ci | buried location |
| scripts/audit/append-audit-trail.sh | bash | Audit | unknown | part of internal audit system |
| scripts/audit/append-run-jsonl.sh | bash | Audit | unknown | logging pipeline |
| scripts/audit/append-run-log.sh | bash | Audit | unknown | logging pipeline |
| scripts/audit/export-ready-audit.sh | bash | Audit | unknown | audit export |
| scripts/ci/governance-gate.sh | bash | Release | ci | overlaps verify intent |
| scripts/content-validator/validate-content.cjs | node | Validation | manual/ci | duplicate entrypoint |
| scripts/content-validator.js | node | Validation | manual | duplicate entrypoint |
| scripts/deploy/deploy-check.sh | bash | Deploy | manual | pre-prod |
| scripts/deploy/deploy-check-preflight.sh | bash | Deploy | manual | overlaps |
| scripts/deploy/deploy-check-production.sh | bash | Deploy | manual | prod-only |
| scripts/governance/full-governance-run.sh | bash | Orchestration | manual | script framework |
| scripts/governance/full-governance-run-with-export.sh | bash | Orchestration | manual | extended framework |
| scripts/governance/indexing-guard.sh | bash | Distribution | manual | duplicate logic |
| scripts/governance/project-cleanup.sh | bash | Maintenance | manual | destructive risk |
| scripts/governance/ready-gate.sh | bash | Release | manual | overlaps |
| scripts/governance/release-audit-check.sh | bash | Release | manual | overlaps |
| scripts/governance/structure-audit.sh | bash | Validation | manual | overlaps |
| scripts/governance/structure-diff-report.sh | bash | Audit | manual | reporting |
| scripts/governance/structure-parity-check.sh | bash | Validation | manual | overlaps |
| scripts/governance/user-content-guard.sh | bash | Validation | manual | overlaps |
| scripts/guards/indexing-guard.js | node | Distribution | ci/manual | canonical guard |
| scripts/guards/sitemap-guard.js | node | Distribution | ci/manual | canonical guard |
| scripts/maintenance/project-cleanup.sh | bash | Maintenance | manual | duplicate |
| scripts/maintenance/version-bump.sh | bash | Maintenance | manual | not governance |
| scripts/postdeploy/smoke-check.sh | bash | Release | manual | post-deploy |
| scripts/release/check-git-tag.sh | bash | Release | manual | tag validation |
| scripts/release/env-snapshot.sh | bash | Release | manual | env capture |
| scripts/release/release-from-tag.sh | bash | Release | manual | release execution |
| scripts/release/release-ready.sh | bash | Release | manual | overlaps |
| scripts/release.sh | bash | Release | manual/ci | top-level |
| scripts/softfocus-stage.sh | bash | Orchestration | manual | legacy pipeline |
| scripts/stage-runner-linear.sh | bash | Orchestration | manual | legacy |
| scripts/stage-runner-linear-v3.sh | bash | Orchestration | manual | legacy |
| scripts/stages/* | bash | Orchestration | manual | stage framework |
| scripts/version-bump.sh | bash | Maintenance | manual | duplicate |

---

## Summary

- Total scripts: excessive
- Authority split: YES
- Duplication present: YES
- Safe for direct clean: NO

