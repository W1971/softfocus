---
title: "SoftFocus v2 — Axis Decision Record"
status: DESIGN-ONLY
implementation: FORBIDDEN
version: v2.0-design
---

## Decision

Для SoftFocus v2 утверждена **одна аналитическая ось**:

**Cognitive Load Variability**  
(Изменчивость когнитивной нагрузки)

---

## Rationale

v1 объясняет устойчивое истощение (burnout).
v2 предназначен для состояний, где:

- функциональность сохранена,
- сон формально достаточен,
- но ясность мышления нестабильна.

Это не продолжение burnout
и не его ранняя стадия.

---

## Canonical Definition

**Cognitive Load Variability** —  
это степень нестабильности когнитивной нагрузки во времени,
при которой восстановление не может стабилизироваться.

Ось описывает:
- фрагментацию,
- разрывы ритма,
- потерю когерентности,

но **не усталость и не истощение**.

---

## Architectural Separation

v1 axis:
burnout → recovery capacity → compensation

v2 axis:
load variability → coherence loss → fragmentation

Оси:
- не пересекаются
- не суммируются
- не отображаются одновременно

---

## Governance Constraints

- ❌ Нет рекомендаций
- ❌ Нет протоколов действий
- ❌ Нет productivity-языка
- ❌ Нет мотивационного фрейминга

Допустим только объяснительный слой.

---

## Status

- Implementation: запрещена
- UI: запрещён
- CI gates: отсутствуют
- Next step: design-only exploration

