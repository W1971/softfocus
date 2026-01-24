# RFC — Recovery Scoring v1

Status: ACCEPTED
Version: 1.0
Effective-Date: 2026-01-24

Source-Of-Truth:
- scripts/core/recovery/scoreRecovery.cjs

Questions:
- Q1..Q12

Weights:
- sleep: 30
- fatigue: 25
- compensation: 25
- inertia: 20

Bands:
- stable: >=80
- strained: 60-79
- degraded: 40-59
- critical: <40

Exclusions:
- Q13..Q15 not scored

Change-Policy:
- RFC required
- new checksum
- new fixtures
b83f18f22f99c79cd7ec68c68a09c2177ac19e27ba43fe4eb3ba4db8c2eeebdc  scripts/core/recovery/scoreRecovery.cjs
