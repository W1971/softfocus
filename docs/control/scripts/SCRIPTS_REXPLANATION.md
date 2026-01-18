# SoftFocus — Scripts Re-Explanation (Internal)

This document explains why each script exists, what risks it prevents,
and how it supports a production-ready SoftFocus workflow.

Scripts are not “helpers”.
They are governance and safety mechanisms.

---

## 0) Principles

- **Source of truth stays clean**: only code + canonical docs in git.
- **Noise is removable**: builds, caches, logs, dependencies.
- **Secrets never enter history**: not even test keys.
- **Validation is automated**: tone, structure, terminology cannot drift.
- **Scaling stays controlled**: programmatic SEO must remain uniform.

---

## 1) Archive Script (Bash)

### Purpose
Create a timestamped archive of files that should not be committed or that
commonly break pushes (secrets, build artifacts, large binaries).

### What it protects
- Accidental commits of:
  - `.env*` secrets
  - `node_modules`
  - `.next`, `out`, `.vercel`, `build`
  - logs
- GitHub rejects due to large binaries
- Repeated secret-scanning incidents

### Operational role
Use before:
- release builds
- force-push / history rewrite work
- moving between environments

### Notes
- The script should be **non-destructive**: it moves files into `archive/<timestamp>/`.
- The archive folder should be **git-ignored**.

---

## 2) Content Validator (Node.js)

### Purpose
Enforce SoftFocus content invariants automatically:
- neutral, clinical tone
- no motivational framing
- no urgency language
- canonical terminology consistency
- pSEO structural requirements
- audience-specific constraints (where defined)

### Why it matters
SoftFocus is an assessment-driven system.
If content drifts, trust collapses and SEO authority weakens.

Validator makes drift **technically difficult**.

### Typical use
- Locally before committing content
- In CI as a hard gate for merges/deployments

---

## 3) Audience Coverage Checker (Node.js)

### Purpose
Confirm that declared audiences are actually implemented as pSEO pages.

### Why it matters
At scale, it is easy to:
- miss audiences
- duplicate audiences unintentionally
- believe coverage exists when it doesn’t

This checker turns SEO coverage into a verifiable inventory.

---

## 4) Recommended Improvements (Next-Level)

### A) Archive Script improvements
1. **Dry-run mode**
   - Show what would be moved without changing anything.
2. **Git repo guard**
   - Exit immediately if not inside a git repository.
3. **Exclude archive from scans**
   - Prevent recursion into `archive/`.
4. **Config file**
   - Move path lists into `scripts/archive.config` for easier maintenance.

### B) Content Validator improvements
1. **Severity levels**
   - `error` for hard violations, `warning` for soft issues.
2. **Single source of truth for terminology**
   - Store canonical terms + blacklist rules in one JSON/TS module.
3. **Locale policy enforcement**
   - Enforce which locales are allowed for which content types.
4. **Better frontmatter parsing**
   - Use a YAML parser to avoid edge cases in `key: value` parsing.
5. **Rule IDs and output formatting**
   - `SF-CONTENT-001`, `SF-PSEO-003` for stable reporting.

### C) Audience checker improvements
1. **Separate audience from locale**
   - Declare `AUDIENCES = [...]` and `LOCALES = [...]`, then validate combinations.
2. **Sitemap cross-check**
   - Confirm found audiences match sitemap URLs.
3. **Fail mode vs report mode**
   - `--strict` to fail CI, default to warnings locally.

---

## 5) Suggested Workflow

### Local (developer)
1. Run archive script (optional, when needed)
2. Run content validation
3. Run audience coverage report
4. Commit

### CI (required)
1. Content validation (fail on error)
2. Audience coverage (warn or fail in strict mode)
3. Build checks

---

## 6) Hard Rules (Non-Negotiable)

- Never commit secrets (real or test keys).
- Never store keys in docs.
- Never allow content drift from canonical terminology.
- pSEO pages must not contain advice/instructions.
- Programmatic SEO is distribution, not new concepts.

