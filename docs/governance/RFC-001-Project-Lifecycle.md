# RFC-001: SoftFocus Project Lifecycle Governance

Status: ACTIVE  
Version: 1.0  
Audience: Maintainers, Auditors, CI

---

## 1. Цель

Настоящий RFC определяет:
- фазы жизненного цикла SoftFocus,
- допустимые переходы между фазами,
- механизм автоматического enforcement через CI.

---

## 2. Фазы

### Phase A — Architecture
- Определяется структура репозитория
- Структура фиксируется (LOCKED)
- Все архитектурные решения документируются

### Phase B — Localization
- Разрешены только контентные изменения
- Структура неизменна
- Любое структурное требование инициирует новую версию Phase A

### Production
- Разрешены деплой и релизы
- Governance enforcement обязателен
- Аудит — append-only

---

## 3. Enforcement

- `structure-audit.sh` — источник фактов
- `lifecycle-policy.yaml` — источник правил
- CI блокирует любые нарушения

---

## 4. Нерушимое правило

> Если правило не проверяется автоматически,  
> оно не считается правилом.

---

## 5. Статус

Данный RFC является частью LOCKED governance kernel.
