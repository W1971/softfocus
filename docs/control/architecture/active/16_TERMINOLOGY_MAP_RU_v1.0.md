# SoftFocus — Terminology Map (EN ↔ RU)

Version: v1.0  
Status: ACTIVE  
Phase: Phase B (Localization)  
Audience: Translators, maintainers, auditors

---

## Purpose

This document defines the **canonical mapping**
between English and Russian terminology in SoftFocus.

The goal is to ensure:
- semantic stability across languages
- zero reinterpretation
- identical meaning in all locales

This document is **authoritative** for RU localization.

---

## Core Principles (Hard Rules)

- Translation is semantic, not stylistic
- One EN term → one RU term
- No synonyms
- No explanations inside translations
- No cultural adaptation

If a concept cannot be translated directly,
the EN term must be preserved.

---

## Canonical Terminology Table

| English (EN) | Russian (RU) | Notes |
|-------------|-------------|-------|
| Governance | Управление | Строго системное, не «менеджмент» |
| Readiness | Готовность | Техническая готовность, не субъективная |
| READY FOR DEPLOY | ГОТОВ К РАЗВЁРТЫВАНИЮ | Капс сохраняется |
| LOW RISK | НИЗКИЙ РИСК | Не «малый», не «незначительный» |
| STRUCTURAL FAIL | СТРУКТУРНЫЙ СБОЙ | Не «ошибка», не «дефект» |
| Audit | Аудит | Без «проверка» |
| Audit Trail | Аудиторский след | Фиксированный термин |
| Override | Ручное решение | Не «исключение» |
| Human Override | Ручное подтверждение | Всегда с указанием human |
| Phase | Фаза | Не «этап» |
| Phase B | Фаза B | Буква не переводится |
| Localization | Локализация | Не «адаптация» |
| Structure | Структура | Не «архитектура» |
| Architecture | Архитектура | Только системная |
| Lock / Locked | Зафиксировано | Не «заблокировано» |
| Release | Релиз | Не «выпуск» |
| Deploy | Развёртывание | Не «публикация» |
| Script | Скрипт | Не «сценарий» |
| Stage | Стадия | Не «этап» |
| Runner | Исполнитель | Контекст: script runner |
| Validation | Валидация | Не «проверка» |
| Deterministic | Детерминированный | Технический термин |

---

## Terms Explicitly NOT Translated

The following terms must remain in EN in RU texts:

- SoftFocus
- RUN / RUN_ID
- JSON / JSONL
- CI
- Git
- Tag

---

## Change Policy

- Any change requires a new version of this document
- Silent changes are forbidden
- All RU texts must be consistent with this table

---

## Final Declaration

This terminology map is **binding** for Phase B (RU).

