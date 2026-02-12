---
title: "Mobile Layout Constraints (Expo SDK 54 / RN 0.81)"
type: "mobile-contract"
scope: "mobile"
phase: "phase-d"
mutability: "frozen"
---

# Mobile Layout Constraints

## 1) Layout primitives (RN)
- Использовать SafeAreaView (iOS) и учитывать status bar.
- Скролл только там, где реально нужно (Result может быть ScrollView, вопросы — нет).
- Один вопрос на экран: фиксированная вертикальная структура.

## 2) Typography & spacing
- Крупный основной текст вопроса (читабельность > плотность).
- Максимум 4 варианта ответа, крупные touch targets.
- Минимальная высота touch target: 44–48dp.
- Межстрочный интервал: не "плотный". Воздух обязателен.

## 3) Navigation
- Без сложных стеков.
- Достаточно Stack: Orientation -> Assessment -> Result.
- Back: разрешён только внутри assessment (не превращать в “путешествие”).

## 4) Performance / determinism
- Никаких сетевых запросов для вычисления результата.
- Вычисление результата локально и синхронно (Hermes).
- Никаких анимаций, которые выглядят как “engagement”.

## 5) State handling
- Ответы хранятся локально в памяти до результата.
- Опционально: локальное сохранение последнего результата (без истории/прогресса).
- Никаких аккаунтов.

## 6) Internationalization
- Контент через locale-aware словарь.
- Длина строк RU/AR учитывается: избегать фиксированных высот для блоков текста.
- RTL (AR): layout должен поддерживать direction без “ломания”.

## 7) Accessibility
- VoiceOver / TalkBack: все кнопки и опции имеют label.
- Контраст читаемый, но без “тревожных” сигналов.

## 8) Forbidden UI patterns (Phase D alignment)
- Графики, тренды, календарь, “улучшение”, “цель”.
- Награды/бейджи/серии/напоминания.
- Любые paywall UX элементы.
