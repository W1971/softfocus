# SoftFocus — Governance Terms (Canonical)

Version: 1.0  
Status: CANONICAL / ACTIVE  
Audience: Core maintainers, auditors, CI systems

---

## Purpose

Этот документ фиксирует канонические термины SoftFocus governance.
Он предотвращает семантический дрейф и обеспечивает единое понимание
между документацией, тестами и CI.

---

## Terms

### RUN
Один полный прогон линейного governance-флоу, зафиксированный в:
- `tests/runs/<RUN_ID>/run.log`
- `tests/runs/<RUN_ID>/run.jsonl`

RUN является единицей аудита.

---

### RUN_ID
Уникальный идентификатор RUN, который:
- создаёт одну директорию `tests/runs/<RUN_ID>/`;
- не переиспользуется;
- используется как неизменяемый идентификатор аудита.

---

### TEST
Тест = один RUN, то есть один полный прогон линейного governance-флоу.
Тест доказывает управляемость системы (scripts/rules/locks/authorization),
а не корректность прикладного кода как такового.

---

### SCENARIO (Scenario ID)
Тестовый сценарий — shell-скрипт с уникальным ID (например `TS-READY-BASE-001`),
который обязан:
- писать оба лога (human + JSONL);
- проходить `tests/helpers/verify-test-logs.sh`.

---

### CHECK
Отдельная проверка в рамках RUN, которая:
- имеет понятное имя;
- фиксирует результат PASS/FAIL;
- при необходимости фиксирует риск (NONE/LOW/HIGH).

CHECK отражается в логах.

---

### RESULT
Итоговое решение RUN (в human log) и итоговая классификация готовности.

RESULT обязан быть финальной (или явно итоговой) записью human-лога.

---

### READY CLASSIFICATION (Готовность к деплою)
Канонические состояния готовности репозитория/системы к деплою:

- STRUCTURAL FAIL
- LOW RISK
- READY (READY FOR DEPLOY)

Эти состояния определяют:
- допускается ли human override;
- допускается ли release authorization.

---

### STRUCTURAL FAIL
Жёсткий отказ готовности. Override запрещён.
Примеры: checksum mismatch, missing phase locks, build failure.

---

### LOW RISK
Низкорисковый отказ готовности. Override допускается по политике.
Примеры: git dirty, отсутствуют необязательные документы.

---

### READY / READY FOR DEPLOY
Полная готовность к деплою. Override не требуется.
Только READY FOR DEPLOY разрешает переход к release authorization.

---

### HUMAN OVERRIDE
Человеческое решение y/n, допускаемое только в ветке LOW RISK,
и фиксируемое в логах.

---

### RELEASE AUTHORIZATION
Разрешение на выпуск (release), которое возможно только при выполнении
канонического линейного governance-флоу и удовлетворении READY FOR DEPLOY.

---

### LINEAR RUNNER (Canonical Entry Point)
Единственная каноническая точка входа в deploy governance flow:
`scripts/stage-runner-linear.sh`.

Никакой скрипт не имеет права обходить linear runner.

---

### LOCK / PHASE LOCK
Архитектурные lock’и, защищающие неизменяемые фазы (Phase 1 / Phase A).
Мутация locked фаз “в месте” запрещена и должна приводить к отказу готовности.

---

## Compliance Note

Если термин в документации/скриптах используется иначе, чем определено здесь,
это считается нарушением governance и требует обновления канонических документов
(через версионирование, без тихих изменений).
