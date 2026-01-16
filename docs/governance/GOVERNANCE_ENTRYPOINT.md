# SoftFocus — Governance Entry Point (Canonical)

Version: 1.0  
Status: CANONICAL / ENFORCED  
Audience: Core maintainers, CI systems, auditors

---

## Purpose

Данный документ фиксирует **единственную допустимую точку входа**
для выполнения governance-флоу в SoftFocus.

---

## Canonical Entry Point

Единственным допустимым entry point является:

scripts/governance/full-governance-run.sh

---

## Enforcement Rules

1. Ни один сценарий READY / RELEASE не считается валидным,
   если он был запущен напрямую, минуя full-governance-run.sh.
2. Любой RUN, не созданный через canonical entry point,
   считается **non-compliant** и исключается из audit trail.
3. CI и release automation обязаны использовать
   только canonical entry point.

---

## Rationale

Единая точка входа:
- устраняет обходы governance;
- сохраняет линейность;
- делает ответственность явной;
- упрощает аудит.

Governance — это протокол, а не набор утилит.

