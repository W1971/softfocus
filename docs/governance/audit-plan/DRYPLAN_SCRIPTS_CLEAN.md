# SoftFocus — Scripts Dry Clean Plan

**Status:** DRY (NO EXECUTION)  
**Rule:** plan only, no rm, no mv

---

## Planned Actions

### ARCHIVE (move to scripts/_archive)

- scripts/archive/archive-obsolete-bootstrap.sh
- scripts/governance/*
- scripts/stages/*
- scripts/stage-runner-linear*
- scripts/softfocus-stage.sh
- scripts/audit/*
- scripts/deploy/*
- scripts/postdeploy/*
- scripts/release/*
- scripts/maintenance/*
- scripts/version-bump.sh

**Reason:** historical / redundant / framework-level

---

### MERGE

- scripts/content-validator/validate-content.cjs
- scripts/content-validator.js  
→ merge into `scripts/validate-content.js`

- scripts/audience-checker/check-audience-coverage.js  
→ move to `scripts/check-audience-coverage.js`

---

### DELETE (after archive window)

- duplicate version bump scripts
- duplicate cleanup scripts
- bash-based guards replaced by node guards

---

## Risk Policy

| Risk | Action |
|-----|-------|
| LOW | DELETE |
| MEDIUM | ARCHIVE |
| HIGH | ARCHIVE + deprecation notice |

No script is deleted without archive period.

---

## Execution Constraint

- One action type per commit
- No refactor during clean
- No logic change
- Only file movement / removal

