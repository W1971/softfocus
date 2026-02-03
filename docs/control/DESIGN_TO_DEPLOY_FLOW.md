---
type: execution-flow
scope: project
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 12:20 UTC

# SoftFocus — Design to Deploy Flow

## Назначение

Этот документ определяет **единственный допустимый путь**
от design-решений к deploy в SoftFocus.

Любой обход этого потока
считается нарушением governance.

---

## Канонический поток (линейный)

```text
Design Decision
      ↓
Documented Specification
      ↓
Alias Definition (DESIGN_ONLY)
      ↓
Governance Review
      ↓
Alias Promotion → READY
      ↓
Alias Execution
      ↓
Status Aggregation
      ↓
DEPLOY or BLOCK
Подробное описание стадий
1. Design Decision
идея
изменение
уточнение
Не имеет силы,
пока не оформлено документально.
2. Documented Specification
docs/control/**
docs/product/**
docs/mobile/**
docs/web/**
Обязательные требования:
canonical scope
temporal hook
отсутствие логических конфликтов
3. Alias Definition (DESIGN_ONLY)
alias появляется в registry
execution запрещён
статус не учитывается
Цель:
зафиксировать намерение
подготовить future execution
4. Governance Review
проверка конфликтов
проверка authority
проверка scope
Результат:
либо promotion
либо блокировка
5. Alias Promotion → READY
alias становится исполняемым
входит в статусную модель
получает власть
6. Alias Execution
через alias-softfocus
с логированием
без ручных override
7. Status Aggregation
generate-status
CORE aliases → итоговый статус
8. Deploy or Block
READY → deploy разрешён
FAIL → deploy запрещён
Ключевое правило
Deploy — это следствие alias-статуса,
а не отдельное действие.
Статус документа
Этот flow обязателен
для всех фаз начиная с Phase C
и не отменяется Maintenance Mode.
