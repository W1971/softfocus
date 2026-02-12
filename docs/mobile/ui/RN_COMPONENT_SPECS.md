---
title: "SoftFocus Mobile — RN Component Specs"
type: "frontend-spec"
scope: "mobile"
phase: "phase-d"
mutability: "frozen"
---

# RN Component Specs (Phase D)

Цель: минимальные компоненты для Orientation → Assessment → Result.
Нет удержания, нет прогресса, нет графиков, нет истории.

Все тексты — описательные, неклинические, без советов.

---

## 1) Screen: OrientationScreen

**Props**
- locale: string

**UI**
- Header: "SoftFocus"
- Body: 3–4 строки (orientation + non-clinical)
- Primary button: "Начать оценку"

**Forbidden**
- login/register
- “продолжить путь”, “улучшить”, “рекомендации”

---

## 2) Component: QuestionCard

**Props**
- questionText: string
- periodLabel: string (e.g., "Период: последние 14 дней")

**UI**
- Один вопрос на экран
- Текст — крупный, с воздухом
- Без “психологизирующих” формулировок

---

## 3) Component: AnswerScale (0..3)

**Props**
- labels: [string,string,string,string]
- value: 0|1|2|3|null
- onChange: (v:0|1|2|3)=>void

**UI**
- 4 больших selectable rows (touch >= 48dp)
- Нет цветовой тревожности
- Нет “хорошо/плохо”

---

## 4) Screen: AssessmentScreen

**Props**
- role: string
- locale: string
- questionSetId: string
- onComplete: (answers)=>void

**State**
- index: number
- answers: { [questionId]: 0..3 }

**Rules**
- Назад разрешён только внутри assessment
- Никаких процентов и мотивационных сообщений
- Допустимо “Вопрос 7 из 50” (без %)

---

## 5) Screen: ResultScreen

**Props**
- result: ResultContract (app/shared/contracts/result.contract.schema.json)
- locale: string

**Render**
A) State block (large):
- mapping:
  - recovery_closes → "Восстановление закрывается"
  - recovery_unstable → "Восстановление нестабильно"
  - recovery_does_not_close → "Восстановление не закрывается"

B) Profile block:
- 3 строки:
  - доминирующий источник
  - удерживающий механизм
  - предсказуемость/стабильность

C) Interpretation block:
- 2–5 строк (result.interpretation.body)
- Запрещены “нужно/следует/рекомендуется”

D) Boundary (small):
- "Неклиническая оценка."

E) Actions:
- Secondary: "Повторить оценку"
- Secondary: "Закрыть"
(без CTA, без “следующий шаг”)

---

## 6) Entitlement rendering rule (NO messaging)

**Rule**
- result.entitlement.present === true
  → показывать расширенный profile.drivers (2–4 пункта) + +1 строку interpretation
- result.entitlement.present === false
  → показывать базовый профиль без drivers

**Forbidden strings**
- оплатa/подписка/pro/unlock/доступ/премиум/разблокировать

---

## 7) Layout Constraints (must)
- SafeAreaView
- Large typography
- ScrollView только на ResultScreen при переполнении
- RTL-ready layout (для AR в будущем)
