# SoftFocus — Phase D-1: Release Definition & Tagging Rules

Version: v1.0  
Status: ACTIVE  
Phase: D  
Step: 1  
Audience: Maintainers, auditors

---

## Purpose

This document defines **what constitutes a release**
and how releases are **identified and tagged** in SoftFocus.

No CI, automation, or publishing is defined here.

---

## Release Definition

A SoftFocus release is:

- a Git tag;
- pointing to a single commit;
- associated with a frozen documentation state;
- compliant with governance rules.

A commit without a tag is **never** a release.

---

## Tag Requirements

All release tags must be:

- immutable;
- lightweight or annotated (implementation choice);
- unique across the repository;
- human-readable and parseable.

Tags must never be moved or deleted once published.

---

## Versioning Scheme

Release tags follow this format:

`v<MAJOR>.<MINOR>.<PATCH>`

Where:
- MAJOR increments indicate meaning or governance changes;
- MINOR increments indicate additive, non-breaking changes;
- PATCH increments indicate corrections without semantic impact.

Pre-release or metadata suffixes are not defined in Phase D-1.

---

## Documentation Snapshot

Each release must reference:

- the exact commit hash;
- the documentation version set present at that commit;
- the Phase status (LOCKED / ACTIVE) at release time.

Documentation drift after tagging does not affect the release.

---

## Governance Preconditions

A release tag may be created only if:

- all prior phases required for the release are LOCKED;
- no governance violations are present;
- audit artifacts are available for inspection.

---

## Prohibited Actions

It is forbidden to:

- tag a release from a dirty working tree;
- tag without committed documentation;
- reuse or overwrite an existing tag;
- create ad-hoc or informal releases.

---

## Auditability

For each release tag, it must be possible to:

- checkout the tagged commit;
- reconstruct the documentation state;
- verify compliance with governance rules.

---

## Final Statement

Phase D-1 defines **how a SoftFocus release is identified**
without defining **how it is built or distributed**.

