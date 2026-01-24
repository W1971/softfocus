#!/usr/bin/env bash
set -euo pipefail

echo "== v2 Governance Gate =="

TARGET_DIR="docs/roadmap"

# Forbidden: action-oriented implementation language
FORBIDDEN_ACTION_REGEX="\\b(implement|implemented|implementing|build|wire|deploy|ship|enable|execute|run|launch)\\b"

# Forbidden: planning / execution framing
FORBIDDEN_CONTEXT_REGEX="\\b(implementation of|implementation plan|implementation steps|start implementation|begin implementation)\\b"

# Explicitly allowed: prohibition, boundary, compliance, ontology
ALLOWED_PROHIBITION_REGEX="\\b(no|not|forbidden|prohibited|disallowed|excluded|blocked|denied|запрещен|запрещена|запрещено)\\b"
ALLOWED_COMPLIANCE_REGEX="\\b(must comply|compliance|required to comply)\\b"
ALLOWED_LAYER_REGEX="\\bimplementation layer\\b"

MATCHES=$(grep -R -i -n -E "implementation|$FORBIDDEN_ACTION_REGEX" "$TARGET_DIR" || true)

if [[ -n "$MATCHES" ]]; then
  FILTERED=$(echo "$MATCHES" \
    | grep -viE "$ALLOWED_PROHIBITION_REGEX" \
    | grep -viE "$ALLOWED_COMPLIANCE_REGEX" \
    | grep -viE "$ALLOWED_LAYER_REGEX" \
    | grep -viE "$FORBIDDEN_CONTEXT_REGEX" \
    || true)

  if [[ -n "$FILTERED" ]]; then
    echo "ERROR: v2 implementation language detected"
    echo "$FILTERED"
    exit 1
  fi
fi

echo "✔ v2 governance constraints satisfied (DESIGN_ONLY, no implementation)"
