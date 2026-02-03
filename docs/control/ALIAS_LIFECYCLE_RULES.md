---
type: governance-rules
scope: alias-lifecycle
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 12:00 UTC

# SoftFocus — Alias Lifecycle Rules

## Назначение

Этот документ формально определяет **жизненный цикл alias**
в control plane SoftFocus.

Он отвечает на вопрос:
- когда alias существует,
- когда он исполняется,
- когда он влияет на статус проекта,
- и когда он теряет власть.

---

## Базовый принцип

> **Alias — это не команда.  
> Alias — это контракт исполнения.**

---

## Стадии жизненного цикла alias

### 1. DESIGN_ONLY

Назначение:
- спецификация
- планирование
- дизайн будущих стадий

Свойства:
- alias видим
- alias не исполняем
- alias не участвует в `generate-status`

Использование:
- Phase A / Phase C (design)
- RFC preparation

---

### 2. READY

Назначение:
- активный alias
- разрешён к исполнению

Свойства:
- может быть выполнен
- участвует в статусе (если CORE)
- результат логируется

Требование:
- alias должен иметь чёткий target
- alias должен быть однозначен по смыслу

---

### 3. FAIL

Назначение:
- зафиксировать невозможность корректного исполнения

Свойства:
- execution завершился ошибкой
- если alias = CORE → проект = FAIL
- требует анализа, но не обхода

FAIL не может быть:
- замещён вручную
- проигнорирован

---

### 4. LOCKED

Назначение:
- заморозка alias по governance причине

Свойства:
- alias видим
- alias не исполняется
- статус фиксирован

Использование:
- Maintenance Mode
- Incident response
- Phase freeze

---

## Переходы (разрешённые)


DESIGN_ONLY → READY
READY → FAIL
READY → LOCKED
FAIL → READY (только после фикса)

Запрещены:
- DESIGN_ONLY → FAIL
- LOCKED → READY без governance решения

---

## Роль человека

Человек может:
- инициировать execution alias
- читать статус

Человек не может:
- менять статус вручную
- обходить lifecycle
- переопределять агрегацию

---

## Связь с проектным статусом

- Только CORE + READY участвуют в агрегации
- OPTIONAL не влияют на итог
- EXPERIMENTAL всегда исключены

---

## Статус документа

Lifecycle правилa действуют
для всех alias начиная с Phase C
и сохраняются в Maintenance Mode.

