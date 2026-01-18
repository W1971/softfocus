# SoftFocus — Content Validation Rules (Scoped)

Version: v1.3  
Status: LOCKED  
Audience: Maintainers, Auditors  
Scope: Content Governance  
Phase: E

---

## Purpose

This document defines **authoritative content validation rules**
used by automated validators.

Version v1.3 extends zone coverage to **all remaining documentation areas**
and eliminates any possibility of unclassified paths.

This document supersedes v1.2.

---

## Core Principle

**Every document must belong to exactly one zone.**

If a document is unclassified, validation MUST fail.
Unclassified content is considered a governance breach.

---

## Content Zones (Authoritative)

Zones are inferred strictly by directory path.
No file-level overrides are permitted.

---

## Zone A — STRICT (Assessment Core)

Paths:
- `docs/assessment/**`
- `docs/content/**`

Rules:
- no clinical terminology
- no diagnostic framing
- no therapy / treatment language
- no mental health claims
- no user-directed prescriptive language

Rationale:
Defines the product core.  
Clinical drift here invalidates the product classification.

---

## Zone B — PUBLIC EXPLANATION

Paths:
- `docs/public/**`

Rules:
- clinical terms allowed ONLY in explicit negative / boundary context
- no affirmative clinical claims
- no advice or instructions

Rationale:
Explains boundaries without assuming clinical authority.

---

## Zone C — B2B & COMMERCIAL

Paths:
- `docs/b2b/**`
- `docs/monetization/**`

Rules:
- clinical terms allowed ONLY to define exclusions
- no diagnostic or treatment promises
- organization-level framing only

Rationale:
Enterprise communication requires compliance-safe boundaries.

---

## Zone D — PRODUCT & PROTOCOL

Paths:
- `docs/product/**`
- `docs/protocol/**`
- `docs/roadmap/**`

Rules:
- descriptive references to clinical domains allowed ONLY to define exclusion
- no diagnostic authority
- no therapeutic positioning
- no individual advice

Rationale:
Describes system evolution and internal protocols, not clinical services.

---

## Zone E — GOVERNANCE & ARCHITECTURE

Paths:
- `docs/governance/**`
- `docs/architecture/**`
- `docs/scripts/**`

Rules:
- normative language allowed (MUST, REQUIRED, FORBIDDEN)
- descriptive references to any domain allowed
- no contradiction of canonical boundaries

Rationale:
Governance documents are normative by definition.

---

## Zone F — ENGINEERING

Paths:
- `docs/engineering/**`

Rules:
- descriptive technical language allowed
- clinical terms allowed ONLY as exclusion references
- no user-directed advice

Rationale:
Engineering documents describe systems, not assessments.

---

## Zone G — INTERNAL STRATEGY

Paths:
- `docs/internal/**`

Rules:
- descriptive language allowed
- clinical terminology allowed ONLY to define boundaries or exclusions
- no therapeutic or diagnostic claims

Rationale:
Internal strategy may reference regulated domains for positioning clarity.

---

## Zone H — OPERATIONS & RELEASE

Paths:
- `docs/operations/**`
- `docs/release/**`

Rules:
- descriptive and normative language allowed
- clinical terms allowed ONLY in boundary or exclusion context

Rationale:
Operational documents define process, not product behavior.

---

## Zone I — SEO & DISTRIBUTION

Paths:
- `docs/seo/**`

Rules:
- clinical terms allowed ONLY as excluded categories
- no advice, no treatment framing
- distribution-only language

Rationale:
SEO is distribution, not content authority.

---

## Zone J — USER-FACING TRANSLATIONS

Paths:
- `docs/user/**`

Rules:
- must strictly mirror canonical PUBLIC rules
- no additional interpretation
- no clinical claims
- boundary language REQUIRED where clinical terms appear

Rationale:
Translations must not introduce new meaning or authority.

---

## Global Prescriptive Rule (Final)

User-directed prescriptive language is forbidden in ALL zones.

Examples (BLOCK everywhere):
- “You should take breaks.”
- “We recommend changing habits.”

System-directed normative language is allowed ONLY in:
- GOVERNANCE
- ARCHITECTURE
- OPERATIONS
- RELEASE

---

## Validator Contract

Automated validators MUST:
- resolve zone by directory path
- reject unclassified paths
- apply zone-specific rules deterministically
- report zone, rule, and file path

Validators MUST NOT:
- ignore violations
- infer intent beyond scope
- permit silent bypass

---

## Change Policy

Any change requires:
- a new version of this document
- explicit supersession
- synchronized validator update

