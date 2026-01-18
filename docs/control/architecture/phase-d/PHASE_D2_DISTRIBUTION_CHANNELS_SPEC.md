# SoftFocus — Phase D-2: Distribution Channels Specification

Version: v1.0  
Status: ACTIVE  
Phase: D  
Step: 2  
Audience: Maintainers, auditors

---

## Purpose

This document specifies **authorized distribution channels**
for SoftFocus releases.

It defines eligibility and constraints without enabling publication.

---

## Channel Definition

A distribution channel is a controlled path that:

- references a tagged release;
- distributes without modification;
- can be explicitly enabled or disabled;
- is subject to audit.

---

## Authorized Channels

### Channel A — Direct Web Access

Description:
- Access via a controlled web endpoint.

Constraints:
- must reference a tagged release;
- must support rollback;
- must not auto-index unless declared.

---

### Channel B — Controlled Preview

Description:
- Limited-access preview for audit or review.

Constraints:
- access-controlled;
- time-bound or scope-bound;
- no public discovery.

---

### Channel C — Audit Distribution

Description:
- Distribution to auditors or regulators.

Constraints:
- read-only;
- documentation snapshot included;
- no user-facing exposure.

---

### Channel D — Internal Validation

Description:
- Internal distribution for validation purposes.

Constraints:
- non-public;
- isolated from production users;
- removable without impact.

---

## Channel Exclusions

The following are explicitly excluded:

- uncontrolled mirrors;
- third-party redistribution without governance;
- auto-syndication feeds.

---

## Activation Rules

A channel may be activated only if:

- a valid release tag exists;
- Phase D requirements are satisfied;
- activation is documented.

---

## Governance Constraints

- Channel additions require a new Phase D step.
- Channel removals must be documented.
- Undeclared channels are forbidden.

---

## Auditability

For each active channel, it must be possible to:

- identify the release tag;
- confirm channel constraints;
- verify activation authorization.

---

## Final Statement

Phase D-2 defines **where SoftFocus may be distributed**
without defining **when or how distribution occurs**.

