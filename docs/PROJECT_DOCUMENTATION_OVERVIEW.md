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

