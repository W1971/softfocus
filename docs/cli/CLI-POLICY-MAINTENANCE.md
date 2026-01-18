# SoftFocus — Maintenance Execution Policy
## Professional Operational Standard

Version: v1.2
Status: CANONICAL
Applies to: Humans, CI, Automation
Enforcement Level: STRICT

---

## Executive Summary

Maintenance scripts perform intentional and irreversible repository mutation.
They are operational tools, not authority mechanisms.

Accordingly:
- Maintenance scripts are **NOT exposed via `sf`**
- They are executed **explicitly and intentionally**
- They are **NEVER** part of CI release workflows

Any deviation constitutes an architectural violation.

---

## Non-Negotiable Rules

- Maintenance scripts are **NOT exposed via `sf`**
- Maintenance scripts are executed **explicitly and intentionally**
- Maintenance scripts are **NEVER** part of CI release workflows
- Maintenance scripts **MUST NOT** influence READY / NOT READY decisions

These rules are absolute.

---

## Allowed Invocation (Explicit Only)

If invoked manually, usage **MUST** be explicit:

```bash
MODE=dry-run ./scripts/maintenance/project-cleanup.sh
MODE=apply   ./scripts/maintenance/project-cleanup.sh
Invocation requirements:
Full script path
Explicit MODE
No wrappers
No aliases
No abbreviations
No shorthand aliases are permitted.
Forbidden Invocation
The following invocations are strictly forbidden:sf governance cleanup
sf ready cleanup
sf maintenance cleanup
Any maintenance command exposed as governance is invalid by definition.
CI Rules
CI MUST NOT execute maintenance scripts
CI MUST fail immediately if maintenance scripts are executed implicitly
CI MUST NOT mask or suppress maintenance-related execution
Maintenance is a human-authorized operation only.
Audit and Accountability
Maintenance execution implies:
human responsibility
traceability
reviewability
Automation, silence, or convenience are not acceptable justifications.
Architectural Rationale
Maintenance implies mutation.
Mutation implies responsibility.
Authority implies immutability.
These concerns MUST remain separated.
Final Constraint
If a command makes SoftFocus easier to operate
by weakening authority boundaries,
that command is invalid.
End of document.
