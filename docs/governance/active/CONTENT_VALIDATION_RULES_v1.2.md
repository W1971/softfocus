# SoftFocus — Content Validation Rules (Scoped)

Version: v1.2  
Status: LOCKED  
Audience: Maintainers, Auditors  
Scope: Content Governance  
Phase: E

---

## Purpose

This document defines **authoritative content validation rules**
used by automated validators.

Version v1.2 expands zone coverage and clarifies
normative language rules without relaxing any safety constraints.

This document supersedes v1.1.

---

## Core Principle

**Terms are not forbidden globally.  
Context and document role determine validity.**

Validation is scoped by **content zone** inferred from directory path.

---

## Content Zones (Authoritative)

Every document under `docs/` MUST belong to exactly one zone.

If a path is not classified, validation MUST fail.

---

## Zone A — STRICT (Assessment Core)

Paths:
- `docs/assessment/**`
- `docs/content/**`

Purpose:
- assessment logic
- classification models
- interpretation frameworks
- product core definitions

### Rules (STRICT)

Forbidden in any form:
- clinical or medical terminology
- diagnosis / diagnostic framing
- therapy or treatment language
- mental health claims
- prescriptive or advisory language

Examples (BLOCK):
- “diagnoses burnout”
- “therapeutic intervention”
- “mental health condition”
- “you should / must / need to”

Allowed:
- classification
- signal detection
- pattern analysis
- non-clinical state models

Rationale:
These documents define **what the product is**.
Any clinical framing here would reclassify SoftFocus incorrectly.

---

## Zone B — PUBLIC EXPLANATION

Paths:
- `docs/public/**`

Purpose:
- boundary explanation
- trust building
- public-facing clarification

### Rules (PUBLIC)

Allowed ONLY in **explicit negative / boundary context**:
- diagnosis / diagnostic
- therapy / therapeutic
- treatment
- mental health

Boundary language MUST be explicit and local.

Examples (ALLOWED):
- “SoftFocus does not diagnose burnout.”
- “This is not therapy or treatment.”
- “Not a mental health assessment.”

Forbidden (BLOCK):
- affirmative clinical claims
- implied treatment value
- prescriptive advice

Rationale:
Public content must explain limits clearly
without crossing into regulated domains.

---

## Zone C — B2B & COMMERCIAL

Paths:
- `docs/b2b/**`
- `docs/monetization/**`

Purpose:
- enterprise communication
- pilots and positioning
- investor explanation

### Rules (B2B)

Allowed:
- clinical terms ONLY to define exclusions
- compliance-oriented boundary language
- organizational risk framing

Forbidden:
- diagnostic claims
- treatment promises
- individual advice

Rationale:
Enterprise contexts require explicit boundary articulation,
not clinical authority.

---

## Zone D — PRODUCT & PROTOCOL

Paths:
- `docs/product/**`
- `docs/protocol/**`
- `docs/roadmap/**`

Purpose:
- internal product evolution
- protocol descriptions
- phased planning

### Rules (PRODUCT)

Allowed:
- descriptive references to clinical domains
  ONLY to explain exclusion or differentiation
- system-level language

Forbidden:
- diagnostic claims
- therapeutic positioning
- prescriptive guidance to individuals

Rationale:
These documents describe system structure and evolution,
not user-facing claims.

---

## Zone E — GOVERNANCE & ARCHITECTURE

Paths:
- `docs/governance/**`
- `docs/architecture/**`
- `docs/scripts/**`

Purpose:
- rule definition
- enforcement explanation
- system guarantees

### Rules (GOVERNANCE)

Allowed:
- normative and prescriptive language
  (e.g. “MUST”, “REQUIRED”, “FORBIDDEN”)
- descriptive references to any domain
- explicit boundary definitions

Forbidden:
- contradictions with canonical boundaries

Rationale:
Governance documents are normative by design.
Prescriptive language here is mandatory, not optional.

---

## Global Prescriptive Rule (Clarified)

Prescriptive language directed at USERS is forbidden in all zones.

Examples (BLOCK everywhere):
- “You should take breaks.”
- “We recommend changing habits.”

Normative language directed at the SYSTEM or PROCESS is allowed
in GOVERNANCE and ARCHITECTURE zones.

---

## Validator Contract

Automated validators MUST:
- resolve zone by directory path
- apply zone-specific rules
- fail fast on violations
- report zone, rule, and file path

Validators MUST NOT:
- apply global word bans
- silently ignore violations
- infer semantic intent beyond scope

---

## Change Policy

Any modification requires:
- a new version of this document
- explicit supersession
- synchronized validator update

