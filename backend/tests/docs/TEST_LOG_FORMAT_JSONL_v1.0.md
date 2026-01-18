# Test Log Format — JSONL (Machine Readable)

## Назначение

Этот лог используется для:

- машинной агрегации
- генерации дашбордов
- анализа трендов риска
- корреляции релизов и override-решений

---

## Расположение

tests/runs/<RUN_ID>/run.jsonl

---

## Формат

- один JSON-объект на строку
- append-only
- порядок строк = порядок событий

---

## Обязательные поля

- timestamp (ISO 8601)
- run_id
- scenario_id
- script
- check
- result (PASS / FAIL)
- risk (NONE / LOW / HIGH)
- human_override (true / false)

---

## Пример строки

{
  "timestamp": "2026-01-16T10:00:00Z",
  "run_id": "RUN_2026_01_16_001",
  "scenario_id": "TS-READY-BASE-001",
  "script": "stage-runner-linear.sh",
  "check": "repository_integrity",
  "result": "PASS",
  "risk": "NONE",
  "human_override": false
}
