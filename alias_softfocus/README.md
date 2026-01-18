# Root alias_softfocus

This directory is the repository-level control-plane.

- Commands in `bin/` provide a stable, meaning-based interface.
- These commands orchestrate domain-level tooling (backend scripts/aliases, frontend toolchain).
- No business logic should live here.

Add this directory to PATH for direct execution:
  export PATH="/absolute/path/to/repo/alias_softfocus/bin:$PATH"
