#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="deploy-production.log"
: > "$LOG_FILE"

log() { echo "[PRODUCTION] $1" | tee -a "$LOG_FILE"; }
fail() { echo "[PRODUCTION][FAIL] $1" | tee -a "$LOG_FILE"; exit 1; }
ok() { echo "[PRODUCTION][OK] $1" | tee -a "$LOG_FILE"; }

log "Starting production deployment checks"

required_envs=(
  NODE_ENV
  APP_URL
  PROTOCOL_TOKEN_SECRET
  PROTOCOL_DB
  STRIPE_SECRET_KEY
  STRIPE_WEBHOOK_SECRET
  STRIPE_PROTOCOL_PRICE_ID
  PROTOCOL_FROM_EMAIL
)

for v in "${required_envs[@]}"; do
  [ -n "${!v:-}" ] || fail "Missing env: $v"
  ok "Env present: $v"
done

[ "$NODE_ENV" = "production" ] || fail "NODE_ENV must be production"

[ "${#PROTOCOL_TOKEN_SECRET}" -ge 32 ] || fail "PROTOCOL_TOKEN_SECRET too short"

if [[ "$PROTOCOL_TOKEN_SECRET" =~ (test|change|example) ]]; then
  fail "PROTOCOL_TOKEN_SECRET looks like placeholder"
fi

if [[ "$STRIPE_SECRET_KEY" == sk_test_* ]]; then
  fail "Stripe test key detected in production"
fi

if [ "$PROTOCOL_DB" != "postgres" ]; then
  fail "Production requires PROTOCOL_DB=postgres"
fi

[ -n "${DATABASE_URL:-}" ] || fail "DATABASE_URL missing for postgres"
ok "Postgres configuration valid"

log "Production checks completed successfully"
