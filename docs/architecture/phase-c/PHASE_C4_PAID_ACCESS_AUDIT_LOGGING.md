# SoftFocus — Phase C-4: Paid Access Audit & Logging Rules

Version: v1.0  
Status: ACTIVE  
Phase: C  
Step: 4  
Audience: Maintainers, auditors

---

## Purpose

This document defines **audit and logging rules**
for paid access enforcement in SoftFocus.

Logs exist solely to support governance,
traceability, and audit review.

---

## Logging Scope

Logging applies only to:
- paid boundary enforcement decisions;
- access allow / deny outcomes.

Logging never applies to:
- assessment execution;
- scoring or classification;
- interpretation rendering.

---

## Log Characteristics

All logs must be:

- append-only;
- immutable once written;
- timestamped;
- machine-readable.

Logs must not be edited or reprocessed.

---

## Required Log Fields

Each log entry must include:

- timestamp (ISO 8601);
- run_id;
- resource_id;
- required_access_class;
- user_access_class;
- decision (ALLOW | DENY);
- enforcement_version;
- governance_context_id.

No additional fields are permitted in Phase C-4.

---

## Log Format

- One JSON object per line (JSONL);
- UTF-8 encoding;
- newline-delimited;
- no compression at write time.

---

## Failure Rules

If logging fails:
- enforcement decision still applies;
- failure must be detectable by governance checks;
- system stability must be preserved.

No retries or buffering logic is defined here.

---

## Access to Logs

- Logs are read-only after creation;
- Access is limited to governance and audit roles;
- Logs must not be exposed to end users.

---

## Governance Constraints

- Logging rules are binding for Phase C;
- Field changes require a new Phase C step;
- Violations block phase progression.

---

## Auditability

Each log entry must be:
- traceable to a specific enforcement decision;
- reproducible under audit conditions;
- verifiable against Phase C-3 rules.

---

## Final Statement

Phase C-4 defines **how paid access decisions are recorded**
without analyzing, interpreting, or monetizing those records.

