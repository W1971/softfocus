# SoftFocus — Target Script Surface (Contract)

**Status:** PROPOSED  
**Principle:** minimal, auditable, authoritative

---

## Canonical Script Set

Only the following scripts are allowed as active surface:

scripts/
├── softfocus.sh # single entrypoint (alias)
├── archive.sh # safety / hygiene
├── validate-content.js # content integrity
├── check-audience-coverage.js # distribution integrity
├── verify.sh # release gate
└── guards/
├── indexing-guard.js
└── sitemap-guard.js
---

## Contract Rules

- One function → one authoritative script
- No duplicate entrypoints
- No orchestration frameworks
- No destructive maintenance scripts
- No version bump automation
- CI and humans use ONLY `softfocus.sh`

---

## Disallowed Categories

- stage runners
- full governance pipelines
- cleanup scripts
- migration helpers (post-migration)
- helper utilities

Any script outside the contract is considered **non-canonical**.

