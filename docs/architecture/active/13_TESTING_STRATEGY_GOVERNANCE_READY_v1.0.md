# SoftFocus — TESTING STRATEGY
## Governance & READY FOR DEPLOY

Version: v1.0  
Status: ACTIVE  
Scope: Governance scripts, READY FOR DEPLOY, release authorization

---

## Цель

Эта стратегия описывает, **как проверяется работоспособность всей системы governance**:

- скрипты
- правила
- блокировки
- READY FOR DEPLOY
- человеческие override-решения

Цель — не тестировать код как таковой, а **доказывать управляемость системы**.

---

## Что считается тестом

Тест — это **один полный прогон линейного governance-флоу**, зафиксированный:

- в человеко-читаемом логе
- в машинно-читаемом JSONL
- с уникальным `run_id`

---

## Области покрытия

Тесты обязаны покрывать:

1. Репозиторий (git clean / dirty)
2. Content validation
3. Архитектурные lock’и
4. Build determinism
5. READY FOR DEPLOY классификацию:
   - STRUCTURAL FAIL
   - LOW RISK
   - READY
6. Человеческие решения (y/n)
7. Release authorization

---

## Типы сценариев

Каждый сценарий имеет ID:

- `TS-READY-BASE-*` — базовые проверки
- `TS-READY-LOW-*` — LOW RISK с override
- `TS-READY-FAIL-*` — жёсткие блокировки
- `TS-RELEASE-*` — выпуск из тега

---

## Инварианты (ЖЁСТКИЕ ПРАВИЛА)

- Логи **append-only**
- Логи **никогда не редактируются**
- Один RUN = одна директория
- Отсутствие логов **не блокирует выполнение**, но блокирует governance

---

## Связь со скриптами

Каждый тест обязательно ссылается на конкретные скрипты:

- stage-runner-linear.sh
- tests/offline/ready-for-deploy.sh
- scripts/helpers/*
- scripts/locks/*
- scripts/release/*

---

## Результат

Эта система позволяет:

- воспроизводить решения задним числом
- строить дашборды риска
- видеть деградацию governance со временем
- доказывать, что релизы контролируемы
