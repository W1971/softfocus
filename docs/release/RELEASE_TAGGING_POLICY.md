---
type: release-policy
scope: project
status: active
---

# Release Tagging Policy

## Rule

Every production-capable state MUST be tagged.

## Tag Format

v<major>.<minor>.<patch>-phase-c

Examples:
- v1.5.0-phase-c
- v1.5.1-phase-c

## Preconditions

A tag MAY be created only if:

- stage-bundle PASS
- alias bundle PASS
- bundle guards PASS
- Phase C is frozen

## Forbidden

- Tagging without bundle regeneration
- Tagging with uncommitted bundle artifacts

