---
type: policy
scope: bundle-pointers
status: active
last_verified_utc: 2026-02-02T12:35Z
---

# Project Bundle Pointer Policy

## Rule

The following files are canonical pointers:

- artifacts/bundles/project_bundle.CURRENT.md
- artifacts/bundles/latest.md

## Required Semantics

- Both files MUST be byte-identical.
- Both files MUST always represent the most recently generated bundle.

## Enforcement

- `bundle-diff-guard.sh` evaluates structure using `latest.md`.
- The bundle generator MUST update both pointers on every run.

Manual edits are forbidden.

