# SoftFocus — Release Policy

## Rules
- Production deployments are allowed only from git tags.
- Preflight and production gates are mandatory.
- Environment snapshots must be recorded before deployment.
- Post-deploy smoke checks must pass.

## Principle
If a release is not reproducible, it is not allowed.
