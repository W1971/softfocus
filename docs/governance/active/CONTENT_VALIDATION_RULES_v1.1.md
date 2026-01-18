# SoftFocus — Content Validation Rules (Scoped)

Version: v1.1  
Status: LOCKED  
Audience: Maintainers, Auditors  
Scope: Content Governance  
Phase: E

---

## Purpose

This document defines **canonical content validation rules**
used by automated validators.

It explains:
- what language is restricted,
- where it is restricted,
- why restrictions differ by content zone.

No validator may implement rules not described here.

---

## Core Principle

**Terms are not forbidden globally.  
Context determines validity.**

Validation is scoped by **document role**, not by words alone.

---

## Content Zones (Authoritative)

All documents under `docs/` belong to exactly one zone,
determined by their directory path.

---

## Zone A — STRICT (Assessment Core)

Paths:
- `docs/assessment/**`
- `docs/content/**`

Purpose:
- core assessment logic
- interpretation rules
- product definitions

### Rules (STRICT)

Forbidden in any form:
- clinical or medical terms
- therapy / treatment language
- diagnostic framing
- advice or instruction language

Examples (BLOCK):
- “diagnoses burnout”
- “therapeutic intervention”
- “mental health condition”
- “you should do”
- “we recommend”

Allowed:
- neutral system descriptions
- structural explanations
- non-prescriptive language

Rationale:
These documents define the product itself.
Any clinical or advisory drift here compromises trust.

---

## Zone B — PUBLIC EXPLANATION

Paths:
- `docs/public/**`

Purpose:
- explain boundaries
- build trust
- clarify what SoftFocus is / is not

### Rules (PUBLIC)

Allowed **only in negative or boundary context**:
- diagnosis / diagnostic
- therapy / therapeutic
- treatment
- mental health

Examples (ALLOWED):
- “SoftFocus does not diagnose burnout.”
- “This is not therapy.”
- “Not a mental health assessment.”

Forbidden (BLOCK):
- affirmative clinical claims
- implicit advisory language
- prescriptive statements

Examples (BLOCK):
- “This helps diagnose…”
- “Provides therapeutic guidance”
- “You should change…”

Rationale:
Public documents must explain boundaries clearly
without crossing into clinical claims.

---

## Zone C — B2B & COMMERCIAL

Paths:
- `docs/b2b/**`
- `docs/monetization/**`

Purpose:
- enterprise communication
- pilots, summaries, positioning

### Rules (B2B)

Allowed:
- boundary statements
- risk framing
- non-clinical comparisons

Forbidden:
- diagnostic claims
- treatment promises
- advice directed at individuals

Rationale:
B2B content may reference clinical domains
only to define limits and responsibilities.

---

## Zone D — GOVERNANCE & ARCHITECTURE

Paths:
- `docs/governance/**`
- `docs/architecture/**`
- `docs/scripts/**`

Purpose:
- describe system behavior
- explain governance mechanisms

### Rules (GOVERNANCE)

Allowed:
- descriptive use of any terminology
- references to diagnosis, therapy, treatment
  **only as system boundaries or exclusions**

Forbidden:
- none, unless contradicting canonical boundaries

Rationale:
Governance documents describe rules,
not user-facing behavior.

---

## Prescriptive Language Rule (Global)

The following are forbidden in **all zones**:

- direct advice
- instructions to the user
- action steps
- “you should / must / need to”

Examples (BLOCK everywhere):
- “You should take breaks.”
- “We recommend changing habits.”

Rationale:
SoftFocus provides insight, not instructions.

---

## Validator Contract

Automated validators MUST:
- determine zone by file path
- apply zone-specific rules
- fail fast on violations
- report file, rule, and zone

Validators MUST NOT:
- apply global word bans
- silently ignore violations
- attempt semantic interpretation beyond scope

---

## Change Policy

Any change to these rules requires:
- new version of this document
- explicit supersession
- validator update in lockstep

