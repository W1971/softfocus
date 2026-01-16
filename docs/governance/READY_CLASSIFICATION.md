# SoftFocus — READY Classification (Canonical)

Version: 1.0  
Status: CANONICAL / ACTIVE  
Audience: Core maintainers, auditors, CI systems

---

## Purpose

Данный документ фиксирует каноническую классификацию готовности
к деплою (READY FOR DEPLOY) и правила:

- допуска override (human y/n)
- допуска release authorization

Документ является нормативным контрактом для:
- `tests/offline/ready-for-deploy.sh`
- `scripts/stage-runner-linear.sh`
- тестовых сценариев `TS-READY-*`
- CI governance gates

---

## Canonical classifications

| Classification       | Override allowed | Release allowed | Hard stop | Notes |
|---------------------|------------------|-----------------|----------|------|
| STRUCTURAL FAIL      | NO               | NO              | YES      | Жёсткая блокировка. Никаких обходов. |
| LOW RISK             | YES              | ONLY IF YES     | NO       | Требует human decision + audit записи. |
| READY FOR DEPLOY     | N/A              | YES             | NO       | Разрешает release authorization. |

---

## Mapping to Deploy Governance Flow Map

### STRUCTURAL FAIL path
- Ветка: `FAIL (STRUCTURAL) -> STOP (NO OVERRIDE)`
- Причины (примерно):
  - checksum mismatch
  - missing phase locks
  - build failure

### LOW RISK path
- Ветка: `FAIL (LOW RISK) -> SHOW DIFF + GUIDE -> HUMAN y/n -> (NO stop) / (YES audit low)`
- Причины (примерно):
  - git dirty
  - missing optional docs

### READY FOR DEPLOY path
- Условия: все readiness checks пройдены
- Переход: `RELEASE AUTHORIZED`

---

## Required logging

Любое решение о READY classification обязано быть зафиксировано:

1) Human log: `tests/runs/<RUN_ID>/run.log`
- результат в секции RESULT
- при LOW RISK: явно зафиксировать решение человека (YES/NO)

2) JSONL log: `tests/runs/<RUN_ID>/run.jsonl`
- события CHECK
- финальная запись классификации (или отдельный check: `ready_classification`)
- human_override: true/false

---

## Contract binding (tests)

Тестовые сценарии `TS-READY-*` обязаны вычислять классификацию через
канонический helper:

- `tests/helpers/ready-classify.sh`

Вывод этого helper является источником истины для того, что будет записано
в logs.

