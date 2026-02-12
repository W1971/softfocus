---
title: "Phase D UX Compliance Checklist (Mobile)"
type: "governance-check"
scope: "mobile"
phase: "phase-d"
status: "active"
---

# Phase D UX Compliance Checklist — Mobile

## A. No new meaning
- [ ] Результат формируется ТОЛЬКО из recovery-capacity-v1 (scoreRecovery.cjs).
- [ ] Никаких новых шкал, стадий, индексов, “burnout score”.
- [ ] Никаких “норм”, “здоров/нездоров”, “патология”.

## B. Non-clinical boundary
- [ ] На экране результата есть минимальная неклиническая граница.
- [ ] Нет медицинских терминов, диагнозов, терапии, лечений.

## C. No recommendations / no advice
- [ ] Текст результата описательный: "наблюдается/устойчиво/нестабильно".
- [ ] Нет "нужно/следует/рекомендуется/сделайте".
- [ ] Нет поведенческих CTA (даже мягких).

## D. Terminal endpoint (no funnel)
- [ ] Нет регистрации/логина.
- [ ] Нет пушей, streaks, прогресса, графиков, “истории улучшений”.
- [ ] Нет “следующего шага” как маршрута.

## E. Monetization binding (No UI)
- [ ] НЕТ слов: оплата, подписка, pro, unlock, доступ, премиум.
- [ ] Entitlement влияет только на глубину текста/профиля, без сигналов причины.

## F. Minimal surfaces
- [ ] Не более 4 экранов (Orientation, Assessment, Result, optional note inline).
- [ ] Никаких дополнительных “гайдов” внутри мобильного UI.

## G. Runtime split
- [ ] Контракт результата и логика лежат в app/shared.
- [ ] Mobile UI импортирует только контракт/результат, не лезет в web.
