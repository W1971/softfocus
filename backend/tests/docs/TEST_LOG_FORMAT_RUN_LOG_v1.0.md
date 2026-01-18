# Test Log Format — Human Readable

## Назначение

Этот лог предназначен для:

- ручной инспекции
- линейного трассирования выполнения
- review решений (в т.ч. человеческих)

---

## Расположение

tests/runs/<RUN_ID>/run.log

---

## Формат

- обычный текст
- строго линейный
- без JSON
- без перезаписи

---

## Обязательные секции

- RUN
- SCENARIO
- CHECK
- RESULT

---

## Пример

[RUN] RUN_2026_01_16_001  
[SCENARIO] TS-READY-BASE-001  

START: stage-runner-linear.sh  
CHECK: repository integrity — PASS  
CHECK: content validation — PASS  
CHECK: architecture lock — PASS  
CHECK: build determinism — PASS  

RESULT: READY FOR DEPLOY
