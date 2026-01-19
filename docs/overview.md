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


---

## Distribution and Depth Constraints

SoftFocus growth is governed by explicit architectural boundaries.

Role-based pages function exclusively as distribution overlays and are
constrained by the Role Page Specification. They do not introduce new
products, assessments, or role-specific logic.

Depth content, including the Structured Recovery Protocol, is governed
by the Protocol Access Boundary and exists only as post-assessment material
delivered via entitlement.

These constraints ensure that the system remains linear, auditable,
and product-first as it scales.


cat <<'EOF' >> docs/overview.md

---

## Lifecycle: A → B → C

SoftFocus evolves through controlled lifecycle phases.

### Phase A — Operation & Observation
The system is frozen.
No content, product, or logic changes are permitted.
The goal is to validate stability, search interpretation,
and entitlement-based monetization under real conditions.

### Phase B — Minor Expansion (v1.x)
Minor versions extend distribution only.
They may add role-based entry points or language coverage
without modifying product logic, calculators, or protocols.

### Phase C — Major Expansion (v2.x)
Major versions introduce a new analytical axis.
Existing product axes remain unchanged.
Each new axis includes its own calculators, interpretation,
and protocol, governed by the same entitlement model.

This lifecycle ensures that SoftFocus remains linear,
auditable, and product-first as it evolves.
EOF


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

# 5_days_plan — SoftFocus (Post-Z2 Execution) (remove after complete this tasks)

**Context:**  
Baseline v1 fixed · Governance active · Recovery calculator (Y) delivered ·  
Product entitlement execution (Z2) implemented and committed.

**Objective of the next 5 days:**  
Stabilize the system, close governance loops, and move from _“implemented”_ to _“operationally reliable”_ without expanding scope.

---

## Day 1 — Stabilization & Hygiene (No New Features)

**Goal:** Ensure the current state is clean, reproducible, and boring.

### Tasks

- Run full local cycle:
  - `npm run content:lint`
  - `./scripts/ci/pre-product-tests.sh <run_id>`
  - entitlement scenario (`TS-ENTITLEMENT-GRANT-001`)
- Verify:
  - `run.jsonl` entries are emitted correctly
  - alias statuses are generated without manual intervention
- Remove or explicitly park:
  - leftover experimental scripts
  - commented or unused CI helpers
- Confirm:
  - working tree clean after commit
  - no hidden FAIL masked as WARN

**Deliverable**

- Zero failing checks
- One clean baseline run recorded in `tests/runs/`

---

## Day 2 — Governance Hardening (Read-Only Changes)

**Goal:** Make rules unambiguous and future-proof.

### Tasks

- Review `backend/config/content-rules.json`:
  - confirm calculator ≡ assessment strictness everywhere
  - confirm WARN vs FAIL behavior matches intent
- Add or refine documentation:
  - when WARN is acceptable
  - when CI _must_ fail
- Ensure every CORE alias has:
  - a clear purpose
  - a documented failure meaning

**Deliverable**

- Governance rules frozen for v1.x
- No logic changes, only clarification

---

## Day 3 — Recovery Calculator Validation (Product Reality Check)

**Goal:** Validate that the recovery calculator actually behaves like a product.

### Tasks

- Manually walk through recovery calculator logic:
  - edge cases (very low / very high scores)
  - deterministic behavior check
- Validate scoring → interpretation mapping:
  - no motivational language
  - no clinical leakage
- Write a short internal note:
  - “What this calculator explains well”
  - “What it deliberately does not explain”

**Deliverable**

- Confidence that calculator insight matches product promise
- No code changes unless a _clear_ defect is found

---

## Day 4 — Product Entitlement Audit & Dry-Run

**Goal:** Prove that monetization is auditable and boring.

### Tasks

- Run entitlement script multiple times with different RUN_IDs
- Inspect:
  - `run.jsonl` consistency
  - absence of duplicate or ambiguous records
- Simulate future payment source:
  - stub environment variables
  - confirm entitlement logic does not depend on UI
- Document:
  - what constitutes a _valid_ entitlement
  - how revocation would work (even if unsupported)

**Deliverable**

- Entitlement flow understood end-to-end
- No hidden coupling between delivery and UI

---

## Day 5 — Freeze & Prepare Next Phase

**Goal:** End the week with a clear stopping point and a clean handoff.

### Tasks

- Tag the repository (if not already):
  - e.g. `v1.3.0-entitlement`
- Write a short internal snapshot:
  - what is done
  - what is intentionally not done
- Decide next direction (one only):
  - **Z3:** payment source integration
  - **Distribution:** SEO + entry points
  - **Second calculator:** compensation / load

**Deliverable**

- Tagged, explainable system state
- One clear next step, nothing half-started

---

## Guiding Rules for These 5 Days

- No new domains
- No refactors “because it’s nicer”
- No user accounts, dashboards, or funnels
- If it can’t be audited, it doesn’t ship

---

**Outcome after Day 5:**  
SoftFocus is not just _built_, but **operable** — with governance, product logic, and monetization aligned and under control.
