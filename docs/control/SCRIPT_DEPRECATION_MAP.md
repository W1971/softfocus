---
type: governance-map
scope: scripts
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 11:30 UTC

# SoftFocus — Script Deprecation Map

## Назначение

Этот документ **фиксирует статус legacy scripts**
без их удаления или модификации.

Цель:
- сохранить историю
- исключить использование
- предотвратить accidental execution

---

## Принцип

> Script может существовать,  
> но не иметь власти.

---

## Категории

### A. Deprecated — Orchestration

Скрипты, объединяющие несколько стадий
и нарушающие alias authority.

Примеры:
- scripts/stage-runner-linear.sh
- scripts/stage-runner-linear-v3.sh
- scripts/softfocus-stage.sh
- scripts/governance/full-governance-run*.sh

Статус:
- хранить
- не использовать
- не вызывать

---

### B. Deprecated — Duplicate Entry

Скрипты, дублирующие функции alias.

Примеры:
- scripts/version-bump.sh
- scripts/maintenance/project-cleanup.sh
- scripts/governance/project-cleanup.sh

Статус:
- запрещены к использованию
- сохранены для истории

---

### C. Canonical Guards (Exception)

Скрипты, используемые через alias
и считающиеся допустимыми.

Примеры:
- scripts/guards/indexing-guard.js
- scripts/guards/sitemap-guard.js

Статус:
- разрешены
- только через alias

---

## Правило использования

Любой script:
- не указанный в alias registry
- или не вызываемый alias

считается **неактивным**.

---

## Важно

Этот документ **не инициирует cleanup**.

Cleanup возможен только:
- после отдельного RFC
- и после Phase D exit (если будет)

