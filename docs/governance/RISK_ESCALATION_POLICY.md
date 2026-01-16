# SoftFocus — Risk Escalation Policy

Version: 1.0  
Status: CANONICAL / ACTIVE  
Audience: Core maintainers, CI systems, auditors

---

## Purpose

Данный документ предотвращает деградацию governance
за счёт частых LOW RISK override-решений.

---

## Escalation Rules

### Rule 1 — Consecutive LOW RISK
- 3 LOW RISK RUN’а подряд → REQUIRED HUMAN REVIEW
- Review должен быть зафиксирован в audit trail

---

### Rule 2 — LOW RISK + Override Frequency
- 5 override-решений за последние 10 RUN’ов →
  governance warning
- CI может быть переведён в strict mode

---

### Rule 3 — STRUCTURAL FAIL
- Любой STRUCTURAL FAIL:
  - override запрещён
  - требует устранения причины
  - повторный RUN обязателен

---

## Enforcement Scope

- Политика применяется:
  - при ручном review
  - в CI governance gate
  - при подготовке релизов

---

## Rationale

LOW RISK — допустимое исключение,
но не нормальный режим работы.

Governance должна деградировать **явно**, а не незаметно.

