# SoftFocus — Phase D-4: Release Audit Artifacts Specification

Version: v1.0  
Status: ACTIVE  
Phase: D  
Step: 4  
Audience: Maintainers, auditors

---

## Purpose

This document specifies the **mandatory audit artifacts**
that must accompany every SoftFocus release.

These artifacts enable reproducibility, governance verification,
and independent audit.

---

## Artifact Set (Mandatory)

Each release must include the following artifacts,
all referencing the same release tag.

### A1 — Release Manifest

File:
- `docs/releases/RELEASE_MANIFEST.md`

Must include:
- release tag;
- commit hash;
- release date (UTC);
- phase lock states (A, B, C, D);
- checksum reference (if applicable).

---

### A2 — Governance Compliance Declaration

File:
- `docs/releases/GOVERNANCE_COMPLIANCE.md`

Must confirm:
- required phases are LOCKED;
- no governance violations detected;
- enforcement and audit rules unchanged.

---

### A3 — Indexing Declaration

File:
- `docs/seo/INDEXING_DECLARATION.md`

Must specify:
- release tag;
- indexing state (ENABLED / DISABLED);
- scope of indexed resources (if partial).

Undeclared indexing is forbidden.

---

### A4 — Documentation Snapshot Reference

File:
- `docs/releases/DOCUMENTATION_SNAPSHOT.md`

Must reference:
- documentation version set;
- repository commit hash;
- parity status (EN↔RU).

---

### A5 — Audit Log Pointers

File:
- `docs/releases/AUDIT_LOG_POINTERS.md`

Must list:
- relevant audit log files or locations;
- log schema versions;
- retention policy reference.

No log content is embedded here.

---

## Placement Rules

- All artifacts must be committed before tagging.
- All artifacts must exist at the tagged commit.
- Artifacts must be read-only after release.

---

## Validation Rules

A release is invalid if:
- any mandatory artifact is missing;
- artifacts reference different tags;
- artifacts were modified after tagging.

---

## Governance Constraints

- Artifact requirements are binding for Phase D.
- Additions require a new Phase D step.
- Omissions block release distribution.

---

## Auditability

From a tagged release, it must be possible to:
- locate all audit artifacts;
- verify their internal consistency;
- confirm governance compliance.

---

## Final Statement

Phase D-4 defines **what evidence accompanies a release**
to prove **how and why it was authorized**.

