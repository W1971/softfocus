# TEST LOGGING SYSTEM — READY FOR DEPLOY

Version: v1.0  
Status: ACTIVE  
Scope: Governance / Offline tests  

---

## Purpose

This directory defines how all governance and READY FOR DEPLOY tests
are logged, stored, and audited.

Logs are not debug artifacts.
They are governance evidence.

---

## Log Types

### 1. Human-readable log

Location:
tests/runs/<RUN_ID>/run.log
Purpose:
- linear narration of what happened
- readable by a human
- suitable for review and decision-making

Content examples:
- scenario start
- script execution order
- warnings
- STOP reasons
- human decisions (y/n)

---

### 2. Machine-readable log (JSONL)

Location:
tests/runs/<RUN_ID>/run.jsonl 
Purpose:
- machine aggregation
- dashboard generation
- trend analysis

Format:
- one JSON object per line
- append-only

Minimal required fields:
- timestamp
- run_id
- scenario_id
- script
- check
- result (PASS / FAIL)
- risk (NONE / LOW / HIGH)
- human_override (true / false)

---

## Invariants

- Logs are append-only
- Logs must never be edited
- Each run has exactly one directory
- Logs are not required for runtime execution

---

## Status

This logging system is mandatory for all governance tests.
