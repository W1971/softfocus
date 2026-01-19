# SoftFocus — Overview, Architecture & Product Plan

**Version:** v1.2  
**Status:** ACTIVE  
**Mode:** governance-aware, product-first

---

## 1. What SoftFocus Is

**SoftFocus** is a Russian(multi)(En/Es/Ar)-language analytical platform focused on:

- cognitive load
- early burnout signals
- recovery capacity
- sustainable productivity without pressure

The project is **explicitly non-clinical**:

- no diagnosis
- no therapy replacement
- no medical claims

SoftFocus is positioned as a **thinking and orientation tool**,  
not a quiz, checklist, or motivational product.

---

## 2. Product Domains

SoftFocus is structured around **product-grade domains**, not content streams.

### 2.1 Assessments (`/testy`)

- Deterministic
- Behavior-based
- Product-level strictness
- Standalone value without payment

### 2.2 Calculators (`/kalkulyatory`)

- Sleep, recovery, compensation
- **Inherit assessment-level strictness**
- Deterministic scoring
- Explainable interpretation

### 2.3 Guides (`/guides`)

- Analytical explanations
- Mechanism-focused
- SEO-oriented
- Reduced strictness (WARN-level)

### 2.4 Blog (`/blog`)

- Contextual and SEO content
- Lowest strictness tier
- Never product-critical

---

## 3. Core Product Axis

All products are aligned to a single canonical axis:

**burnout → recovery capacity → compensation**

This axis is enforced via:

- content-validator rules
- governance severity levels
- CI gating

---

## 4. Governance Layer (Mandatory)

### 4.1 Content Validator

The `content-validator` is a **first-class architectural component**.

It enforces:

- non-clinical boundaries
- canonical terminology
- audience discipline
- product vs blog strictness

Severity model:
| Content Type | Canonical Missing |
|-------------|-------------------|
| assessment | FAIL |
| calculator | FAIL |
| guide/blog | WARN |

---

### 4.2 Boundary-Aware Validation

Documents may reference clinical terms **only if**:

- located in PRODUCT or PUBLIC zones
- explicit non-clinical boundary is present

Violations block CI.

---

## 5. Y → Z Bridge: From Recovery to Product

### 5.1 Y — Recovery Calculator

The recovery calculator delivers:

- recovery capacity scoring
- burnout risk orientation
- compensation signal detection

It produces **structured, repeatable insight**, not advice.

---

### 5.2 Z2 — Product Entitlement Execution

Paid products are governed as **entitlements**, not downloads.

An entitlement is valid when:

1. Delivery script executes
2. An audit event is written to `run.jsonl`
3. Severity = PASS
4. No human override

This creates:

- auditable delivery
- CI-verifiable monetization
- passive, low-maintenance revenue flow

---

## 6. Alias System

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

No manual status setting is allowed.

---

## 7. Economic Model

Primary revenue:

- one-time digital products ($15–30)

Secondary revenue:

- affiliate tools (non-clinical)

Advertising:

- only after ~50k monthly visitors
- never core revenue

---

## 8. Long-Term Goal

12-month target:

**$4,000+ / month**, driven by:

- product-grade assessments
- recovery calculators
- entitlement-based digital products
- organic SEO

---

## Summary

SoftFocus is not a blog.

It is:

- a governed analytical system
- with deterministic products
- formal validation
- auditable monetization
- and minimal operational overhead

The project is built as an **asset**, not a workflow.
E

## For the reference

## Связанные нормативные файлы (обновление ожиданий)

- Чтобы v1.1 governance-aware был воспроизводимым, считаются обязательными следующие документы и скрипты:

## Документация

docs/overview.md ← этот файл
docs/control/CI_ALIAS_POLICY.md
docs/control/ALIAS_CLASSIFICATION.md
docs/control/GOVERNANCE_ENTRYPOINT.md
docs/product/ASSESSMENT_AS_PRODUCT.md (если есть / или планируется)

## Governance / CI

backend/config/content-rules.json
backend/scripts/content-validator.js
backend/scripts/content-validator/validate-content.cjs
backend/scripts/content-validator/emit-run-jsonl.js
scripts/ci/pre-product-tests.sh
alias_softfocus/bin/generate-status
