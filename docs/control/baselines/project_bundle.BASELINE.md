# SoftFocus — Project Bundle

- Version: 1.5.0
- Generated: 2026-02-02 03:05:37 (UTC)

> This bundle is generated exclusively by the script:
> `scripts/bundles/generate_project_bundle.sh`
>
> Important:
> - This bundle is a derived, read-only artifact.
> - Manual edits are forbidden and ignored.
> - Any meaningful change to structure, ordering,
>   or included meaning MUST be implemented by
>   amending the generating script itself.

---

==================================================
FILE: docs/overview.md
==================================================

# SoftFocus — Overview, Architecture & Product Plan  
**(Operational Update & Forward Roadmap)**

**Version:** v1.5.0  
**Status:** ACTIVE (Operational, Phase B readiness achieved)  
**Mode:** governance-aware, product-first, deterministic

---

## 0. Current Snapshot (Now)

**As of today:**

- Recovery Scoring v1 — **frozen**
- Frontend calculators — **build PASS**
- Governance pipeline — **deterministic**
- Phase B readiness logic — **defined and enforced**
- System is **technically releasable**

SoftFocus has transitioned from *implementation* to **controlled operation**.

---

## 1. What SoftFocus Is

**SoftFocus** is a multilingual analytical platform  
(RU primary; EN / ES / AR planned) focused on:

- cognitive load under sustained effort  
- early burnout risk signals  
- recovery capacity degradation  
- compensation patterns that mask decline  

The project is **explicitly non-clinical**:

- no diagnosis  
- no therapy  
- no medical claims or norms  

SoftFocus is a **thinking and orientation system**.  
It is not a quiz, checklist, coaching flow, or motivational product.

---

## 2. Product Domains (Operational State)

SoftFocus is structured around **product-grade domains**, each with explicit governance severity.

### 2.1 Assessments (`/testy`)
**Status:** ACTIVE, STABLE

- Deterministic  
- Behavior- and pattern-based  
- Canonical terminology enforced  
- Standalone analytical value without payment  

Assessments remain the **primary analytical entry point**.

**Operational intent:**  
No changes during Phase B or Phase C without RFC approval.

---

### 2.2 Calculators (`/kalkulyatory`)
**Status:** ACTIVE, FROZEN (Recovery Calculator v1)

- Sleep, recovery, compensation  
- Inherit assessment-level strictness  
- Deterministic scoring  
- Explainable, non-adaptive interpretation  

The **Recovery Calculator v1** is formally frozen under governance and is the
**primary monetizable analytical artifact** in v1.x.

---

### 2.3 Guides (`/guides`)
**Status:** LIMITED

- Analytical explanations  
- Mechanism-focused  
- SEO-oriented  
- Reduced strictness (WARN-level)  

Guides **do not define logic** and never override product interpretation.

---

### 2.4 Blog (`/blog`)
**Status:** OPTIONAL / DEFERRED

- Contextual and SEO-only content  
- Lowest strictness tier  
- Never product-critical  

Can remain disabled without system impact.

---

## 3. Core Product Axis (Frozen)

All analytical products align to a single canonical axis:

**burnout → recovery capacity → compensation**

This axis is **frozen for all v1.x** and enforced through:

- content-validator rules  
- governance severity levels  
- CI and Release Gate checks  
- RFC-based change control  

Any modification requires a new RFC and version bump.

---

## 4. Governance Layer (Operational)

Governance is no longer experimental — it is **operational infrastructure**.

### 4.1 Content Validator

The `content-validator` is a **first-class architectural component**.

It enforces:

- non-clinical boundaries  
- canonical terminology  
- audience discipline  
- strict separation of product vs distribution content  

Severity model:

| Content Type | Canonical Missing |
|-------------|-------------------|
| assessment  | FAIL              |
| calculator  | FAIL              |
| guide/blog  | WARN              |

FAIL blocks CI and release.

---

### 4.2 Boundary-Aware Validation

Documents may reference clinical terminology **only** if:

- explicitly scoped as exclusionary  
- a non-clinical boundary is present  
- located in PRODUCT or PUBLIC zones  

Violations block CI and Release Gate.

---

## 5. Analytical Core: Recovery Scoring (v1)

### 5.1 Recovery Scoring v1
**Status:** FROZEN, RELEASE-SAFE

- Deterministic core implementation  
- Runtime-safe, non-frontend-owned logic  
- QA-covered with golden fixtures  
- Governed by RFC and checksum  

Artifacts:

- `scripts/core/recovery/scoreRecovery.cjs`  
- `tests/qa/runRecoveryQA.cjs`  
- `docs/governance/RFC-RECOVERY-SCORING-v1.md`  

This scoring model is the **single source of truth** for recovery analysis in v1.

---

### 5.2 Interpretation & UI

- Mobile: orientation-only, low-cognitive-load  
- Desktop: analytical detail, penalty breakdown  
- No adaptive logic  
- No behavior shaping  

UI is a **pure consumer** of the frozen scoring core.

---

## 6. Product Entitlement Model

### 6.1 Entitlements (Z-layer)

Paid products are delivered as **entitlements**, not files.

An entitlement is valid only when:

1. Delivery script executes  
2. An audit event is written (`run.jsonl`)  
3. Severity = PASS  
4. No manual override  

This ensures:

- auditable delivery  
- CI-verifiable monetization  
- low operational overhead  

---

## 7. Alias Control Plane

SoftFocus is operated via a **single control plane**: `alias-softfocus`.

Aliases expose:

- validation  
- readiness  
- delivery  
- governance state  

Statuses are derived automatically:

- READY  
- LOW_CONFIDENCE  
- FAIL  

Manual status setting is not permitted.

Phase B uses a **deterministic, blocking `generate-status`** as the
authoritative readiness signal.

---

## 8. Lifecycle Status (Updated)

### Phase A — Observation
**Status:** COMPLETE (historical, frozen)

- Recovery Scoring v1 frozen  
- Governance rules validated  
- No longer modifiable  

---

### Phase B — Controlled Expansion
**Status:** ACTIVE (current)

Phase B focuses on **surface expansion without logic risk**.

Constraints:

- no changes to scoring logic  
- no new analytical axes  
- no protocol modification  

---

## 9. Operational Roadmap

### Next 7 Days — Stabilization & Release

**Goals:**

- Declare **Operational Readiness v1**  
- Cut release tag (e.g. `v1.0.0-operational`)  
- Browser-level verification of calculators  
- Minimal production deployment  

**Actions:**

- Finalize `OPERATIONAL_READINESS.md`  
- Publish release notes  
- Light real-user testing (non-clinical framing)  
- No feature work  

---

### Next 1 Month — Phase B Expansion (Low Risk)

**Goals:**

- Increase reach without touching logic  
- Validate monetization assumptions  
- Observe user interpretation patterns  

**Actions:**

- EN language rollout (content-only)  
- SEO surface expansion (guides)  
- Role-based landing pages  
- Entitlement delivery dry-runs  
- No scoring or UI complexity changes  

---

### Next 3 Months — Phase C Preparation

**Goals:**

- Decide whether Phase C is justified  
- Accumulate operational evidence  
- Reduce unknowns before introducing new axes  

**Actions:**

- Traffic and conversion analysis  
- Governance friction analysis  
- Draft RFCs for:
  - potential new analytical axis  
  - independent calculators  

**Decision Gate:**  
If Phase C is not clearly justified, SoftFocus v1 continues as a **stable operational asset**.

---

## 10. Economic Model

Primary revenue:

- one-time digital analytical products ($15–30)

Secondary revenue:

- non-clinical affiliate tools

Advertising:

- only after ~50k monthly visitors  
- never core revenue  

---

## Summary

SoftFocus is now:

- a **governed analytical system**  
- with deterministic, frozen product logic  
- formal validation and release control  
- auditable monetization  
- minimal operational overhead  

The project is built and operated as a **long-term asset**,  
not as a content workflow or growth experiment.

---

## Operational Readiness

SoftFocus v1 transitions from implementation to operation only after formal declaration.

Operational readiness is defined by:

- `docs/control/OPERATIONAL_READINESS.md`

After declaration:

- product logic remains frozen  
- governance rules are stable  
- SoftFocus v1 is treated as an **operational asset**

This rule is mandatory and overrides informal interpretations.

Routing decisions (including the root route) are governed by
docs/control/ROOT_ROUTE_POLICY.md.

---

## Project Phase Status

- Current phase: **Phase D**
- Phase D status: **COMPLETE**
- Project mode: **Maintenance Mode**

Phase D is formally closed and archived.
All subsequent changes must comply with Maintenance Mode constraints.

==================================================
FILE: docs/PROJECT_DOCS_HIERARCHY.md
==================================================

# Project Documentation Hierarchy — SoftFocus

## Purpose

This document defines the hierarchy of documentation within the SoftFocus project.

It clarifies:
- which documents are canonical
- which are supporting
- which are historical or reference-only

The hierarchy exists to prevent semantic drift
and to keep the project linear and auditable.

---

## Level 0 — Single Entry Point

**docs/overview.md**

- The only mandatory entry point
- Defines what SoftFocus is
- Describes product scope, governance model, and lifecycle
- All other documents must be compatible with this file

If a document conflicts with `overview.md`,
it is considered invalid.

---

## Level 1 — Governance and Control

These documents define rules, constraints, and enforcement.

Directories:
- docs/governance/
- docs/control/
- docs/control/PROJECT_BUNDLE_POLICY.md

Characteristics:
- normative
- mandatory
- enforced by CI where applicable

Changes here are rare and explicit.

---

## Level 2 — Product and Execution

These documents define what the product is
and how it is executed.

Directories:
- docs/product/
- docs/frontend/

Characteristics:
- product contracts
- execution boundaries
- platform-specific policies (e.g. mobile)

They must comply with Level 1
and align with Level 0.

---

## Level 3 — Business, Roadmaps, Releases

These documents describe direction and planning,
but do not define product behavior.

Directories:
- docs/business/
- docs/roadmap/
- docs/release/
- docs/releases/

Characteristics:
- informative
- directional
- non-binding

They must not introduce new product logic.

---

## Level 4 — Internal, Reference, Archive

These documents are retained for context,
history, or internal coordination.

Directories:
- docs/internal/
- docs/reference/
- archive/

Characteristics:
- optional
- non-canonical
- safe to ignore for product understanding

---

## Interpretation Rules

- Higher levels override lower levels
- Canonical documents are few by design
- If a document can be removed without breaking the product,
  it is not canonical

---

## Change Policy

This hierarchy is stable as of v1.5.0.

Changes require:
- explicit rationale
- governance approval
- version update

---

## Planning Horizon

### 1 Week
- Enforce hierarchy in new docs
- Reject misplaced documents

### 1 Month
- Audit existing docs against hierarchy
- Downgrade or archive weak documents

### 6 Months
- Reduce total document count if possible
- Prefer clarity over completeness

---

## Naming Note: docs/frontend vs /frontend

SoftFocus uses two layers that share the name "frontend":

- docs/frontend/ — specification and governance documentation
- /frontend/ — runtime implementation and buildable code

Interpretation rule:
- docs/frontend/ defines how the UI must behave
- /frontend must implement and obey those constraints

If implementation diverges from docs/frontend/,
the documentation is considered canonical
and the implementation must be corrected.


### Runtime Split

- app/web → governed by docs/web/**
- app/mobile → governed by docs/mobile/**
- app/shared → governed by docs/product/**

Cross-scope references are forbidden.

## Project Phase Status

- Current phase: **Phase D**
- Mode: **Maintenance**
- Mutability: **Frozen**

No new product logic, surfaces, or meaning
may be introduced under Phase D.

==================================================
FILE: docs/PROJECT_DOCUMENTATION_OVERVIEW.md
==================================================

# SoftFocus Documentation

This directory contains all project documentation, organized by
responsibility layer. Each layer answers a different question.

The structure is designed to:
- prevent semantic drift
- preserve governance clarity
- keep the project auditable

---

## 🧠 control/
**How the system works**

Architecture, backend workflows, CI, alias system, and execution flows.

Typical audience:
- engineers
- maintainers
- CI / release automation

Key documents:
- ARCHITECTURE.md
- CI.md
- SOFTFOCUS_ALIAS_SPEC.md

This layer is normative and enforced.

---

## 🎨 frontend/
**What the user sees and experiences**

Product specs, content rules, protocols, UX constraints, localization,
SEO principles, and public-facing materials.

Typical audience:
- product
- content
- frontend engineers
- SEO

This layer defines user-facing behavior,
not implementation details.

---

## �� business/
**Why and how the project operates commercially**

Monetization strategy, B2B materials, roadmaps, and release intent.

Typical audience:
- founders
- business stakeholders
- partners

This layer must not define product logic.

---

## ⚖️ governance/
**Rules, risk, and compliance**

Governance policies, validation rules, audits,
risk escalation, and lifecycle control.

Typical audience:
- maintainers
- reviewers
- auditors

Overrides all other layers except overview.md.

---

## 🔒 internal/
**Internal-only reasoning**

Engineering constitution, internal notes,
and non-public rationale.

Not for external use.

---

## 🛠 operations/
**Operational execution**

Release operations, operational readiness,
and production policies.

---

## 📜 policy/
**Formal policies**

Maintenance and execution policies.

---

## 📦 releases/
**Historical releases**

Release artifacts and immutable records.

---

## Planning Horizon

### 1 Week
- Freeze documentation structure
- Fix inconsistencies only

### 1 Month
- Validate whether docs answer real questions
- Remove unused or redundant material

### 6 Months
- Decide if documentation volume should remain static
- Prefer deletion over expansion


==================================================
FILE: docs/product/PRODUCT_END_STATE.md
==================================================

---
type: product-definition
scope: global
status: target
mutability: restricted
boundary: non-clinical
---

# SoftFocus — Product End State

## Non-Clinical Scope Declaration

This document is **non-medical and non-clinical**.

It does not provide diagnosis, treatment,
therapeutic guidance, or medical recommendations.

All references to burnout, recovery, load,
or cognitive capacity are **analytical and informational only**.

This document defines the **final intended shape of the SoftFocus product**.

It does not describe current phase status,
implementation details,
or operational constraints.

All execution stages (web, mobile, CI, content)
must converge toward this state.

---

## Core Product Question

SoftFocus exists to answer one question:

**Is recovery closing under sustained cognitive load — or not?**

All product surfaces exist only to support
clear understanding of this condition.

---

## A. Understanding Layer (Primary)

### Purpose

Provide non-clinical understanding of burnout risk
as an abstract analytical signal under sustained load
before any measurement or tooling.

### Characteristics

- text-first
- role-contextual
- deterministic language
- no tools required
- no interaction pressure

### Surface

- Web-first
- SEO / PSEO role pages
- Canonical explanations

### Completion State

“I understand what is happening.”

No further action is required.

---

## B. Analytical Confirmation Layer

### Purpose

Allow users to **verify understanding**
through structured, deterministic assessment.

### Characteristics

- fixed questions
- reproducible results
- no advice
- no behavioral framing

### Surface

- Web and mobile
- Assessments and result orientation screens

### Completion State

“I see my state reflected clearly.”

Return or continuation is optional.

---

## C. Optional Analytical Depth Layer

### Purpose

Offer **additional analytical clarity**
only after understanding exists.

### Characteristics

- optional
- non-prominent
- no progressive disclosure
- no engagement mechanics

### Surface

- Primarily mobile
- Calculators and reference models

### Completion State

“I have enough depth to stop guessing.”

This layer must never be required.

---

## Exit Principle

A user may exit after **A, B, or C**.

Completion at any layer is valid.
No layer may coerce progression to the next.

---

## What the Product Is Not

SoftFocus is not:

- a wellbeing app
- a productivity tool
- a habit system
- a coaching or therapy flow
- a motivational product

It does not provide solutions.
It provides orientation.

---

## Final Success Criterion

SoftFocus succeeds when the user leaves
with **clarity**, not with a plan.


==================================================
FILE: docs/product/runtime/RUNTIME_SPLIT.md
==================================================

---
type: runtime-contract
scope: global
mutability: frozen
---

# Runtime Split Contract

This document defines mandatory runtime separation.

---

## Application Structure

- app/web/**
  Governed by docs/web/**  
  Primary surface for **understanding (Layer A)**

- app/mobile/**
  Governed by docs/mobile/**  
  Primary surface for **embodiment and confirmation (Layers B & C)**

- app/shared/**
  Governed by docs/product/**  
  Shared analytical logic only (no UI)

---

## Rules

- No cross-scope imports
- No shared UI components between web and mobile
- Shared logic allowed only in app/shared

Violations invalidate the build.


==================================================
FILE: docs/mobile/MOBILE_PRODUCT_SCOPE.md
==================================================

---
type: product-scope
scope: mobile
mutability: restricted
---

# SoftFocus — Mobile Product Scope

Mobile is the **primary experiential embodiment**.

Responsibilities:
- quiet orientation
- assessments
- optional calculators

Mobile must work without explanation,
on first contact,
without return expectation.

==================================================
FILE: docs/web/WEB_PRODUCT_SCOPE.md
==================================================

---
type: product-scope
scope: web
mutability: restricted
---

# SoftFocus — Web Product Scope

Web is the **primary understanding surface**.

Responsibilities:
- role-based analytical pages
- deep textual explanations
- SEO / PSEO orientation

Web must work **without any tools or calculators**.

==================================================
FILE: docs/seo/SEO_ENTRY_INDEX.md
==================================================

# SoftFocus — SEO Entry Index

This document defines primary organic entry points
and their intent alignment.

The index is designed for:
- low-frequency, high-intent discovery
- analytical, non-clinical interpretation
- calm entry into assessment logic

---

## Core Assessment (Primary Entry)

### /kalkulyator-sna
- Intent: High
- Purpose: Evaluate recovery–load alignment
- Role: Canonical analytical entry point

All guides ultimately link here.

---

## Conceptual Guides (Explanatory Layer)

### /son-ne-raven-vosstanovleniyu
- Intent: Explanatory
- Purpose: Reframe sleep vs recovery
- Role: Correct a common false assumption

### /kogda-son-ne-pomogaet
- Intent: Problem-aware
- Purpose: Explain recovery failure despite sleep
- Role: Pre-assessment clarification

---

## Systemic Guides (Structural Understanding)

### /guides/kompensaciya-vmesto-vosstanovleniya
- Intent: Analytical
- Purpose: Explain compensation as a risk pattern
- Role: Contextual depth, not action

### /guides/vosstanovlenie-ne-ravno-otdyhu
- Intent: Analytical
- Purpose: Separate rest from recovery capacity
- Role: Cognitive model reinforcement

---

## Linking Principles

- Guides link into assessment
- Assessment links back to relevant guides
- No circular CTAs
- No urgency language
- No behavioral prompts

---

## Indexing Notes

- Low-frequency, high-intent queries only
- Analytical tone preferred
- Avoid medical terminology
- Avoid optimization framing

---

## Planning Horizon

### 1 Week
- Verify internal links consistency
- Ensure canonical paths are stable
- No new pages

### 1 Month
- Observe organic entry behavior
- Adjust internal linking only if confusion appears
- No SEO expansion

### 6 Months
- Decide whether to add 1 new guide or keep index frozen
- Re-evaluate based on real usage, not traffic targets


---

## Canonical Interpretation Anchor

All explanatory SEO entries resolve into a single
canonical interpretation layer:

→ docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md

Rules:
- SEO pages introduce concepts
- Canonical explanations define meaning
- No guide may redefine terminology outside the canonical index

This separation prevents semantic drift
between discovery and interpretation.

---

## Phase D — Wave 3 (Role Pages)

### Sales / Support / Finance

EN / ES / RU / AR role-specific analytical entry points.

Purpose:
- role-contextual framing of burnout risk
- non-clinical, non-advisory orientation
- controlled entry into canonical assessment

All links resolve to:
→ /tests/burnout-test (locale-aware)


==================================================
FILE: docs/seo/PSEO_CANON.md
==================================================

---
type: canon
scope: pseo
status: active
phase: phase-d
last_verified_utc: 2026-02-02T12:15Z
---

# PSEO Canon — Role-Based Burnout Pages

## Purpose

This document defines the canonical structure and constraints
for all role-based burnout test pages (pSEO).

These pages are **discovery-only entry points**.
They do not sell, recommend, or optimize behavior.

---

## Scope

Applies to all pages located under:

/pages/en/
/pages/ru/
/pages/es/
/pages/ar/

---

## Required Frontmatter

Every pSEO page MUST include:

```yaml
type: pseo
locale: <language>
path: /<locale>/<role-path>
status: indexable
phase: phase-d
last_verified_utc: YYYY-MM-DDTHH:MMZ

Canonical Page Structure
------------------------

### H1 — Role + Burnout Test

*   Must include role
    
*   Must include burnout / burnout equivalent
    
*   Must NOT include promises or outcomes
    

Example:

*   "Burnout test for risk analysts"
    
*   "اختبار الاحتراق للمحامين"
    

### Role Load Context

Describe **sustained role-specific load**, not tasks.

Allowed:

*   cognitive burden
    
*   responsibility without control
    
*   prolonged vigilance
    
*   emotional distancing
    

Forbidden:

*   advice
    
*   coping strategies
    
*   optimization language
    

### What the Test Measures

Allowed dimensions:

*   recovery capacity under sustained load
    
*   compensation mechanisms (e.g. emotional distancing)
    
*   persistence of strain over time
    

Forbidden:

*   skills
    
*   performance
    
*   improvement metrics
    

### Non-Clinical Boundary

Required minimal statement:

*   "Evaluación no clínica."
    
*   "تقييم غير سريري."
    
*   "Non-clinical assessment."
    

No expansions.

### Canonical CTA

Exactly ONE link:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   [Run the burnout assessment](//tests/burnout-test)   `

Rules:

*   No urgency
    
*   No sales language
    
*   No alternatives
    

Prohibited Elements
-------------------

*   Recommendations
    
*   Tips or advice
    
*   Medical terminology
    
*   FAQ sections
    
*   Multiple CTAs
    
*   Pricing or product mentions
    

Change Policy
-------------

Allowed:

*   language clarity
    
*   factual correction
    
*   broken links
    

Forbidden without approval:

*   structural changes
    
*   semantic shifts
    
*   new sections
    
*   CTA modification
    


==================================================
FILE: docs/seo/ROLE_PAGES_STATUS.md
==================================================

---
type: seo-scope
status: frozen
date_utc: 2026-02-02
---

# Role-Based Burnout Test Pages — Status

## Scope

All role-based burnout test pages located in:

/pages/en/
/pages/ru/
/pages/es/
/pages/ar/

are classified as:

SEO ENTRY LAYER

## Rules

- Pages are discovery-only
- Pages must not contain sales language
- Pages must not contain recommendations
- Pages must link to the canonical assessment flow
- Pages must not diverge in analytical meaning across languages

## Change Policy

Changes are allowed only for:
- factual corrections
- language clarity
- broken links

Structural or semantic changes require explicit approval.


==================================================
FILE: docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md
==================================================

---
title: "Как SoftFocus объясняет состояние перегрузки"
type: "index"
tone: "analytical"
locale: "ru-RU"
path: "/guides/explanations"
intent: "high"
---

# Канонические объяснения SoftFocus

SoftFocus описывает состояния перегрузки,
burnout и восстановления
как операционные процессы,
а не как личные или клинические проблемы.

Ниже собраны ключевые объяснения,
на которых построена модель проекта.

---

## Восстановление ≠ отдых

Отдых и восстановление не эквивалентны
при высокой когнитивной нагрузке.

Если восстановление не закрывается,
паузы могут не снижать нагрузку.

→ [Восстановление не равно отдыху](/guides/vosstanovlenie-ne-ravno-otdyhu)  
→ [Когда паузы не снижают нагрузку](/guides/kogda-pauzy-ne-snizhayut-nagruzku)

---

## Сон ≠ восстановление

Сон — механизм, а не гарантия.
Его эффект зависит от нагрузки,
в рамках которой он используется.

→ [Сон ≠ восстановление](/son-ne-raven-vosstanovleniyu)  
→ [Когда сон не помогает](/kogda-son-ne-pomogaet)

---

## Компенсация вместо восстановления

Если восстановление не закрывается,
система переходит в режим компенсации,
что ускоряет формирование burnout.

→ [Компенсация вместо восстановления](/guides/kompensaciya-vmesto-vosstanovleniya)

---

## Burnout как операционное состояние

Burnout рассматривается не как диагноз,
а как состояние,
возникающее при хроническом дефиците восстановления.

→ [Оценка burnout с позиции восстановления](/en/tests/burnout-test)

---

## Об инструментах SoftFocus

Инструменты проекта
не дают рекомендаций и норм.
Они показывают,
закрывается ли восстановление
при текущей нагрузке.

→ [Калькулятор сна и восстановления](/kalkulyator-sna)

---

## SEO Entry Mapping (Non-Canonical)

This index is referenced by SEO entry points,
but does not depend on them.

SEO-facing guides:
- introduce questions
- surface confusion
- frame problems

Canonical explanations:
- define terms
- stabilize meaning
- resolve interpretation

Interpretation rule:
If an SEO page and this index diverge,
this index is authoritative.

==================================================
FILE: docs/control/PHASE_C_FREEZE.md
==================================================

---
type: phase-freeze
phase: C
status: frozen
date_utc: 2026-02-02
time_utc: 11:40
---

# Phase C — Architecture Freeze

## Scope

Phase C is formally frozen.

The following components are locked:

- Alias registry schema (docs/control/ALIASES.yaml)
- Alias execution engine (alias-softfocus)
- Project bundle generation
- Bundle freshness and structure guards
- CI stage-bundle gate

## Allowed Changes

- Documentation clarifications (non-structural)
- Release notes
- Operational runbooks

## Forbidden Changes (without RFC)

- Alias registry schema changes
- New alias execution paths
- Bundle structure changes
- CI gate bypasses

Any violation invalidates Phase C status.


==================================================
FILE: docs/release/RELEASE_TAGGING_POLICY.md
==================================================

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


==================================================
REFERENCE: EXECUTION CONTEXT (NON-CANONICAL)
==================================================

- Phase C: ARCHITECTURE FROZEN
- Phase D: EXECUTION & DISTRIBUTION

pSEO role-based pages:
- discovery-only
- non-clinical
- no recommendations
- single canonical assessment entry

Monetization:
- occurs ONLY after result interpretation
- via optional analytical depth
- no pressure, no behavior shaping

---
_This bundle is generated automatically by a canonical script._
_If this bundle appears incorrect or outdated, the generating script must be amended._
