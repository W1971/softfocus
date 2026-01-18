# SoftFocus — CI

CI must execute the same meaning-based commands that humans use locally.

## Backend
- Use backend alias system (pipeline-check, ci-gate).
- Block FAIL and LOW_CONFIDENCE states in CI via ci-gate.

## Frontend
- Install dependencies (npm ci).
- Run tests and build.

## Parity Rule
If a CI job runs a command, the same command must be runnable locally via root aliases.
