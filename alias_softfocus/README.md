# alias-softfocus

`alias-softfocus` is the control-plane CLI for the SoftFocus project.

It provides a single, auditable entry point for:
- scripts
- documentation
- validation
- diagnostics

---

## Core Commands

### List
```bash
alias-softfocus list
Show available commands with their status.
Run
alias-softfocus run <command> [args]
Execute a command respecting DRY_RUN and status rules.
Docs  alias-softfocus docs
alias-softfocus docs <layer>
alias-softfocus docs tree [layer]
alias-softfocus docs search <term>
nspect and navigate project documentation as a system.
Explain
alias-softfocus explain <command>
Explain the purpose and contract of a command.
Doctor
alias-softfocus doctor
alias-softfocus doctor --docs
Run diagnostics on the control-plane and documentation.
Status Model
Each alias may have a status:
READY
LOW_CONFIDENCE
UNKNOWN
FAIL
Status affects:
CI
execution permissions
release readiness
Design Principles
Docs are first-class
One entry point
Explicit status
No silent execution
Auditability over convenience
