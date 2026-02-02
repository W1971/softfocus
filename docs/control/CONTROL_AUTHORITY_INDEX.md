---
type: authority-index
scope: control
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 15:10 UTC

# SoftFocus — Control Authority Index

## Назначение

Этот документ является **единственной точкой определения власти**
в каталоге `docs/control`.

Он отвечает на вопрос:

> *Какие документы имеют силу  
> для design → deploy СЕЙЧАС.*

Все документы, **не перечисленные здесь**, считаются:
- reference
- historical
- explanatory  
и **НЕ МОГУТ**:
- блокировать CI
- разрешать deploy
- определять статус проекта

---

## I. ABSOLUTE AUTHORITY (непосредственно влияет на deploy)

Эти документы:
- читаются CI
- читаются alias
- имеют приоритет над всеми остальными

Обязательные:

- CHECKLIST_EXECUTION_MODEL.md
- CI_LINEAR_STAGE_MODEL.md
- DESIGN_TO_DEPLOY_FLOW.md
- ALIAS_AUTHORITY_MODEL.md
- ALIAS_LIFECYCLE_RULES.md
- ALIAS_STATUS_MODEL.md
- GENERATE_STATUS_CONTRACT.md
- OPERATIONAL_READINESS.md
- PROJECT_META_FREEZE.md

---

## II. EXECUTION POLICY (ограничивает поведение, но не решает)

Документы, которые:
- задают рамки
- НЕ дают разрешения на deploy

- PRODUCT_GATE_POLICY.md
- STAGE_GATE_POLICY.md
- MOBILE_UI_AUDIT_GATE_POLICY.md
- PAYMENT_GOVERNANCE.md
- ENTITLEMENT_CONTRACT.md
- CANONICAL_PIPELINE_CONTRACT.md

---

## III. DECLARATIONS & PHASE RECORDS (read-only)

Исторические фиксации состояний проекта.

- PHASE_A_AND_MOBILE_V1_FREEZE.md
- PHASE_B_COMPLETION_v1.0.md
- PHASE_C_KICKOFF_v1.md
- PHASE_D_DECLARATION.md
- MOBILE_V1_COMPLETE.md
- MOBILE_V1_GOVERNANCE_FREEZE.md

Эти документы **НЕ ИМЕЮТ** власти
над текущим execution.

---

## IV. REFERENCE / ARCHIVE (информативные)

Все остальные документы в `docs/control/**`,
включая:
- architecture/*
- phase-c/*
- phase-d/*
- v2/*
- scripts/*
- templates/*

Их роль:
- объяснять
- документировать
- сохранять историю

---

## Правило интерпретации (жёсткое)

Если документ:
- ❌ не указан в разделе I или II  
→ он **не участвует в design → deploy**

Если два документа конфликтуют:
1. Authority Index
2. Temporal hook
3. НИЧЕГО ДРУГОГО

---

## Запрет

Запрещено:
- добавлять новый control-документ
  без обновления этого индекса
- ссылаться на документ вне индекса
  как на “блокирующий” или “разрешающий”

Нарушение:
→ GOVERNANCE FAIL

