---
title: "SoftFocus v2 — Approval Gate"
status: ACTIVE
scope: governance
mode: design-to-implementation transition
---

# v2 Approval Gate (Design-only → Implementation)

## Purpose

Этот gate определяет единственный допустимый путь,
по которому SoftFocus v2 может перейти из состояния DESIGN_ONLY
в состояние, допускающее ограниченную реализацию.

Gate не является планом работ.
Gate не является разрешением на реализацию по умолчанию.

---

## Current Default

v2 по умолчанию:
- DESIGN_ONLY
- execution: FORBIDDEN
- no UI
- no calculators
- no entitlement wiring
- no runtime artifacts

---

## Allowed Transition

Единственный допустимый переход:

DESIGN_ONLY → LOW_CONFIDENCE

Переход в READY запрещён напрямую.

LOW_CONFIDENCE означает:
- допускаются только ограниченные exploratory изменения
- любые runtime-артефакты должны быть флагируемыми и обратимыми
- релиз и монетизация остаются запрещены

---

## Approval Preconditions (All Required)

1) Decision Closure  
- `docs/roadmap/V2_AXIS_DECISION_RECORD.md` имеет статус CLOSED
- ось одна, альтернативы отклонены
- пересечений с v1 нет (axis separation confirmed)

2) Boundary Reaffirmation  
- non-clinical boundary подтверждён
- отсутствуют: advice, recommendations, терапевтический фрейминг
- language соответствует Phase A (orientation-only)

3) Negative Proof (No Implementation Yet)  
Должно быть доказано, что:
- нет UI wiring
- нет calculator contracts
- нет dataset scoring
- нет entitlement scripts
- нет продакшен-сборок под v2

4) CI Enforcement  
Обязательные gates:
- `scripts/ci/check-v2-governance.sh`
- `scripts/ci/check-phase-a-observation-only.sh`
- alias-level tests проходят

5) Explicit Governance Sign-off  
- фиксируется отдельным документом `V2_APPROVAL_SIGNOFF.md`
- содержит дату, автора, причину, ограничения
- без этого документа переход запрещён

---

## Approval Artifact

Единственный артефакт, разрешающий переход:
`docs/control/V2_APPROVAL_SIGNOFF.md`

До появления signoff:
- v2 остаётся DESIGN_ONLY навсегда

---

## Enforcement Rule

Если `V2_APPROVAL_SIGNOFF.md` отсутствует:
- любые попытки реализации v2 должны блокироваться CI
- статус v2 обязан оставаться DESIGN_ONLY

## Naming Clarification

This document intentionally replaces any notion of
"V2_IMPLEMENTATION_APPROVAL".

v2 is DESIGN_ONLY.

There is no implementation approval artifact by design.
Any future authorization for execution must introduce
a new, explicit governance document and CI gate.
