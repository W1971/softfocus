<!--
Latest bundle pointer
Updated: 2026-01-29 02:03:34 UTC
Source: project_bundle_1.5.0_2026-01-29.md
-->

# SoftFocus — Project Bundle

- Version: 1.5.0
- Generated: 2026-01-29 02:03:34 (UTC)
- Git: 0ff2f93 (phase-c)

- SHA256: af7eb5846f4d1ccb44469745b212cac968a03b2b88610886dbf423e880744a12
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
FILE: docs/product/CANONICAL_THEORY_OF_OPERATION.md
==================================================

---
type: product-theory
boundary: non-clinical
scope: system-wide
mutability: frozen
---

## Scope & Compliance Boundary

This document may reference clinical terminology
**solely to clarify scope exclusion**.

SoftFocus does **not** provide diagnosis, treatment,
therapeutic services, or mental health guidance,
and is not a medical or clinical system.

All terminology is analytical and informational only.

---

# SoftFocus — Canonical Theory of Operation

## Status
Type: product-theory  
Scope: system-wide  
Mutability: frozen (v1.x)

---

## Purpose

This document defines how SoftFocus operates as an analytical system.

It explains **what the system measures**, **how signals are derived**,  
and **what SoftFocus explicitly does not do**.

This is a canonical reference for product, governance, legal,
and enterprise interpretation.

---

## Core Principle

SoftFocus operates on a single analytical axis:

burnout → recovery capacity → compensation

This axis does not represent a medical process.
It represents **operational sustainability under cognitive load**.

---

## Signal Model

### Burnout

Burnout in SoftFocus is an **orientation signal**.

It indicates sustained misalignment between:
- cognitive load,
- recovery capacity,
- compensatory effort.

Burnout is not treated as a diagnosis, condition, or health state.
It is an analytical marker of risk accumulation.

---

### Recovery Capacity

Recovery capacity describes the **system’s ability to restore performance
after load exposure**.

Sleep is used as a **primary observable proxy**, not as a health intervention.
Adequate sleep does not guarantee recovery.
Insufficient or unstable sleep constrains recovery capacity.

---

### Compensation

Compensation represents **effort-based mechanisms** that preserve output
despite constrained recovery capacity.

Compensation explains why performance may remain acceptable
while sustainability degrades.

---

## Assessment Logic

SoftFocus assessments are:

- deterministic,
- reproducible,
- non-adaptive,
- free of recommendations.

Identical inputs always produce identical outputs.

The system describes states, not trajectories.
It does not predict outcomes or improvement.

---

## Interpretation Boundary

SoftFocus provides **orientation and structure**, not solutions.

The system explains:
- why degradation may be gradual,
- why no single failure point exists,
- why common advice may fail under certain constraints.

It does not instruct users what to do.

---

## Non-Clinical Scope

SoftFocus is strictly non-medical and non-clinical.

It does not:
- diagnose conditions,
- provide treatment,
- offer therapy or mental health guidance,
- replace clinical or psychological assessment.

All terminology is analytical and informational only.

---

## Summary

SoftFocus is a structured thinking tool.

It helps individuals and organizations
understand sustainability limits
before failure becomes visible or costly.


==================================================
FILE: docs/product/assessment-model.md
==================================================

# SoftFocus Assessment Model

## Core Formula
Recovery Fit = Sleep × Cognitive Load

Sleep alone is not sufficient.
Load alone is not diagnostic.

## States
- Stable Recovery
- Compensated Load
- Recovery Debt
- Systemic Deficit

## Determinism
The assessment is deterministic.
Identical inputs always produce identical outputs.

## Scope
The model is non-medical and non-clinical.
It describes operational sustainability, not health.

## Non-Clinical Scope Declaration

This document describes an analytical assessment model.
It does not provide diagnosis, treatment, or therapeutic guidance,
and must not be interpreted as a mental health instrument.


==================================================
FILE: docs/product/assessment-results.md
==================================================

## Non-Clinical Scope Declaration

This document is non-medical and non-clinical.

It does not provide diagnosis, treatment,
or medical or psychological advice.

All references to burnout, recovery, load,
or capacity are analytical and informational only.

---


---

### Как интерпретировать этот результат

Если вы хотите понять,
что именно означает ваш результат
и почему рекомендации могут не работать в текущем состоянии,
см. документ:

→ docs/product/i18n/ru/WHAT_SOFTFOCUS_GIVES.md

Он объясняет:
- почему отсутствие диагноза — нормально,
- почему может не быть «точки поломки»,
- почему сейчас важнее границы, а не решения.


---

### How to understand this result

If your result feels accurate
but unclear or difficult to act on,
see:

→ docs/product/i18n/en/WHAT_SOFTFOCUS_GIVES.md

This document explains:
- why a clear diagnosis may not be present,
- why there may be no single point of failure,
- why boundaries matter more than solutions at this stage.



==================================================
FILE: docs/product/WHAT_SOFTFOCUS_GIVES.md
==================================================

## Non-Clinical Scope Declaration

This document is non-medical and non-clinical.

It does not provide diagnosis, treatment,
or medical or psychological advice.

All references to burnout, recovery, load,
or capacity are analytical and informational only.

---

# What SoftFocus Gives

## Purpose

This document explains what SoftFocus provides to users
in situations where there is no clear diagnosis,
no obvious point of failure,
and no simple way out.

Its role is explanatory.
It does not promise recovery, change, or resolution.

---

## The user’s starting condition

Users typically arrive at SoftFocus in a specific state:

- they remain functional
- they continue working and making decisions
- they are not in an acute crisis

At the same time:
- rest no longer restores capacity
- effort produces diminishing returns
- advice feels irrelevant or irritating
- internal self-analysis becomes constant

This state is often more exhausting
than workload itself.

---

## What SoftFocus provides instead of diagnosis

SoftFocus does not provide diagnoses.

Instead, it provides orientation.

Users receive:
- a classification of sustained load
- an understanding of recovery capacity limits
- visibility into compensation mechanisms

This allows users to understand their condition
without framing it as illness or personal failure.

---

## What SoftFocus provides instead of a failure point

Users often search for a moment where something “broke”.

SoftFocus replaces this search with a continuous axis:

burnout → recovery capacity → compensation

This axis explains why:
- degradation can be gradual
- performance may persist while capacity declines
- symptoms appear without a single triggering event

---

## What SoftFocus provides instead of a solution

SoftFocus does not offer a solution or a plan.

It provides boundaries.

Users learn:
- which actions are unlikely to work in their current state
- why additional effort may increase depletion
- why certain recovery attempts backfire

---

## What users actually receive

SoftFocus provides:

1. Language  
2. Structure  
3. Reduced self-blame  
4. Permission to pause

---

## Summary

SoftFocus does not help users “get better”.

It helps them stop misunderstanding what is happening
and stop applying actions that increase depletion.


---
_This bundle is generated automatically. Do not edit manually._
