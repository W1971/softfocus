---
title: "QuestionSet Contract — Phase D"
type: "assessment-contract"
scope: "assessments"
phase: "phase-d"
mutability: "frozen"
---

# QuestionSet Contract

## Назначение
QuestionSet — это **пул наблюдений**, а не тест с результатом.
Он фиксирует сигналы для последующей интерпретации калькулятором.

## Инварианты Phase D
- Никакого скоринга
- Никакой интерпретации
- Никаких советов
- Только сбор сигналов

## Структура
- role: string
- locale: BCP-47
- period_days: integer
- scale: фиксированная (0–3)
- sections: 5 канонических
- questions: 40–60 на роль
- каждый вопрос привязан к section

## Канонические секции
- latency
- residual
- compensation
- predictability
- detachment

## Правило агрегации
Агрегация выполняется ВНЕ questionSet.
QuestionSet не знает о результатах.
