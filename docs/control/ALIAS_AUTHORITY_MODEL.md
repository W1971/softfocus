---
type: governance-model
scope: execution-authority
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 11:00 UTC

# SoftFocus — Alias Authority Model

## Назначение

Этот документ **канонически фиксирует**, что именно
`alias-softfocus` является **единственной авторитетной control plane**
для исполнения, валидации и определения статуса проекта SoftFocus.

Любое исполнение вне alias-модели
считается **неканоническим** и **не имеющим силы**.

---

## Базовый принцип

> **Aliases — это власть.  
> Scripts — это реализация.**

Ни один script не обладает автономной властью.
Вся операционная власть принадлежит alias-слою.

---

## Уровни власти

### 1. Alias Layer (Authoritative)

Расположение:
- `alias_softfocus/`
- `alias_softfocus/bin/*`
- `alias_softfocus/lib/resolve-alias.js`

Роль:
- определяет, *что* может быть выполнено
- определяет, *в каком режиме* это может быть выполнено
- определяет, *участвует ли результат в статусе проекта*

Alias layer:
- видим пользователю
- проверяем CI
- агрегируется в `generate-status`

---

### 2. Script Layer (Non-Authoritative)

Расположение:
- `scripts/**`
- `backend/scripts/**`
- `frontend/scripts/**`

Роль:
- реализация отдельных операций
- выполнение только через alias

Ограничения:
- scripts не могут вызываться напрямую как источник истины
- scripts не определяют READY / FAIL
- scripts не могут агрегировать статус

---

## Запрещённые паттерны

Следующие паттерны считаются нарушением governance:

- прямой вызов script в CI без alias
- наличие нескольких entrypoint’ов для одной функции
- orchestration scripts, объединяющие несколько стадий
- scripts, меняющие состояние проекта без alias-контекста

Нарушение:
→ governance FAIL

---

## Связь с generate-status

Только aliases со статусом:
- `READY`
- и классом `CORE`

участвуют в расчёте итогового статуса проекта.

Scripts **никогда** не участвуют в агрегации напрямую.

---

## Роль человека

Человек:
- может запускать alias
- не может назначать статус вручную
- не может bypass-ить alias authority

---

## Статус документа

Этот документ фиксирует модель власти для всех фаз,
начиная с Phase C и далее (включая Maintenance Mode).

