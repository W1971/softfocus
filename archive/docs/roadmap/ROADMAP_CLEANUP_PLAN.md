# Roadmap Cleanup Plan — SoftFocus

## Status
ACTIVE — classification and freeze only

## Purpose

This document defines how roadmap documents
are classified, constrained, and interpreted.

The goal is to:
- eliminate roadmap ambiguity
- prevent conflicting future directions
- preserve history without operational influence

No files are deleted as part of this plan.

---

## Scope

This plan applies to:
- docs/roadmap/
- docs/business/roadmap-related files
- historical roadmap references in releases

It does not apply to:
- product contracts
- governance rules
- frontend or backend execution

---

## Classification Rules

All roadmap documents must fall into one of the following categories.

### 1. ACTIVE

Characteristics:
- referenced by docs/overview.md
- compatible with current product axis
- used for near-term planning

ACTIVE roadmaps influence decisions.

---

### 2. ARCHIVED (Historical)

Characteristics:
- describe past intentions or experiments
- may no longer match current architecture
- preserved for context only

ARCHIVED roadmaps must not:
- be referenced by overview
- be used to justify new work

---

### 3. SUPERSEDED

Characteristics:
- replaced by a newer roadmap
- partially overlapping or duplicated
- ambiguous if left unclassified

SUPERSEDED roadmaps must:
- clearly reference their replacement
- be excluded from planning discussions

---

## Cleanup Actions (Non-Destructive)

Allowed actions:
- classification (ACTIVE / ARCHIVED / SUPERSEDED)
- moving files into archive folders
- adding short header notes

Explicitly forbidden:
- deleting roadmap files
- rewriting historical intent
- merging documents retroactively

---

## Interpretation Rules

- If two roadmaps conflict, neither is ACTIVE
  until conflict is resolved.
- Only ACTIVE roadmaps may influence execution.
- If a roadmap is not classified, it is treated as ARCHIVED.

---

## Completion Criteria

Cleanup is considered complete when:
- every roadmap file is classified
- only one ACTIVE roadmap exists per phase
- overview.md references only ACTIVE roadmaps

---

## Change Policy

This cleanup plan is valid for v1.5.0.

Any roadmap changes after v1.5.0 require:
- explicit reclassification
- documentation update
- governance acknowledgement

