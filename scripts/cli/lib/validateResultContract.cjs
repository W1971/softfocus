/**
 * Minimal JSON Schema-ish validation (Phase D safe, no deps).
 * Validates only the most critical invariants.
 */

function validateResultContract(result, schema) {
  const errors = [];

  function req(path, cond, msg) {
    if (!cond) errors.push(`${path}: ${msg}`);
  }

  req('contract_version', typeof result.contract_version === 'string', 'must be string');
  req('phase', result.phase === 'phase-d', 'must be phase-d');
  req('boundary', result.boundary === 'non-clinical', 'must be non-clinical');
  req('model.name', result.model && result.model.name === 'recovery-capacity-v1', 'must be recovery-capacity-v1');
  req('locale', typeof result.locale === 'string', 'must be string');
  req('generated_at_utc', typeof result.generated_at_utc === 'string', 'must be ISO date string');

  const ss = result.inputs && result.inputs.section_scores;
  req('inputs.section_scores', ss && typeof ss === 'object', 'missing');
  if (ss) {
    const keys = ['latency','residual','compensation','predictability','detachment'];
    for (const k of keys) {
      req(`inputs.section_scores.${k}`, typeof ss[k] === 'number' && ss[k] >= 0 && ss[k] <= 3, 'must be number 0..3');
    }
  }

  const allowedStates = new Set(['recovery_closes','recovery_unstable','recovery_does_not_close']);
  const allowedConf = new Set(['low','medium','high']);
  req('summary.state', allowedStates.has(result.summary && result.summary.state), 'invalid state');
  req('summary.confidence', allowedConf.has(result.summary && result.summary.confidence), 'invalid confidence');

  const ent = result.entitlement;
  req('entitlement.present', ent && typeof ent.present === 'boolean', 'must be boolean');
  req('entitlement.tier', ent && (ent.tier === 'none' || ent.tier === 'depth_v1'), 'must be none|depth_v1');

  // Schema presence check (best-effort)
  req('schema', schema && typeof schema === 'object', 'schema missing/unreadable');

  return { ok: errors.length === 0, errors };
}

module.exports = { validateResultContract };
