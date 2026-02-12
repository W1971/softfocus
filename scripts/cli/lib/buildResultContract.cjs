/**
 * Build Result Contract (Phase D compliant)
 * - Aggregates answers per section into section_scores (0..3 float)
 * - Calls canonical scoreRecovery.cjs to obtain state classification (source of truth)
 * - Produces interpretation copy (descriptive only; no advice)
 */

const path = require('path');

const { aggregateSection } = require('./aggregateSection.cjs');
const { classifyDrivers } = require('./classifyDrivers.cjs');
const { buildInterpretation } = require('./interpretation.cjs');

function nowUtcIso() {
  return new Date().toISOString();
}

function assertInputShape(input) {
  if (!input || typeof input !== 'object') throw new Error('Input must be an object');
  if (!input.sections || typeof input.sections !== 'object') throw new Error('Input.sections missing');
  const req = ['latency','residual','compensation','predictability','detachment'];
  for (const k of req) {
    if (!Array.isArray(input.sections[k])) throw new Error(`Input.sections.${k} must be an array`);
    if (input.sections[k].length < 3) throw new Error(`Input.sections.${k} must have >= 3 answers`);
  }
  const pd = input.period_days;
  if (!Number.isInteger(pd) || pd < 7 || pd > 30) throw new Error('Input.period_days must be integer 7..30');
  const labels = input.scale_labels;
  if (!Array.isArray(labels) || labels.length !== 4) throw new Error('Input.scale_labels must be array of 4 strings');
}

async function callCanonicalScoreRecovery(sectionScores) {
  // IMPORTANT: Do not re-implement scoring logic here.
  // This only delegates to canonical implementation if present.
  const scorePath = path.resolve(process.cwd(), 'scripts/core/recovery/scoreRecovery.cjs');
  let scoreRecovery;
  try {
    scoreRecovery = require(scorePath);
  } catch (e) {
    // Phase D safe fallback: if canonical scorer is unavailable in this environment,
    // we still emit contract with conservative defaults.
    return {
      state: 'recovery_unstable',
      confidence: 'low'
    };
  }

  // scoreRecovery API may vary; support common patterns:
  // - function(scoreInputs) -> { state, confidence, ... }
  // - { scoreRecovery: fn }
  const fn =
    (typeof scoreRecovery === 'function') ? scoreRecovery :
    (scoreRecovery && typeof scoreRecovery.scoreRecovery === 'function') ? scoreRecovery.scoreRecovery :
    null;

  if (!fn) {
    return { state: 'recovery_unstable', confidence: 'low' };
  }

  // Minimal input, stays within Phase D semantics:
  // We provide deterministic section signals; canonical scorer decides classification.
  const res = await fn({ section_scores: sectionScores });
  if (!res || typeof res !== 'object') return { state: 'recovery_unstable', confidence: 'low' };

  // Normalize expected keys:
  const state = res.state || res.summary_state || res.recovery_state || 'recovery_unstable';
  const confidence = res.confidence || res.summary_confidence || 'low';

  // Ensure bounded enums:
  const allowedStates = new Set(['recovery_closes','recovery_unstable','recovery_does_not_close']);
  const allowedConf = new Set(['low','medium','high']);

  return {
    state: allowedStates.has(state) ? state : 'recovery_unstable',
    confidence: allowedConf.has(confidence) ? confidence : 'low'
  };
}

async function buildResultContract({ input, locale, role, entitled }) {
  assertInputShape(input);

  const section_scores = {
    latency: aggregateSection(input.sections.latency),
    residual: aggregateSection(input.sections.residual),
    compensation: aggregateSection(input.sections.compensation),
    predictability: aggregateSection(input.sections.predictability),
    detachment: aggregateSection(input.sections.detachment)
  };

  const summary = await callCanonicalScoreRecovery(section_scores);

  const drivers = classifyDrivers(section_scores);

  const profile = {
    dominant_load: drivers.dominant_load,
    dominant_mechanism: drivers.dominant_mechanism,
    stability: drivers.stability,
    drivers: drivers.drivers
  };

  const interpretation = buildInterpretation({
    locale,
    summary,
    profile,
    entitled: Boolean(entitled)
  });

  return {
    contract_version: "1.0",
    phase: "phase-d",
    boundary: "non-clinical",
    model: {
      name: "recovery-capacity-v1",
      version: "v1",
      source_of_truth: "scripts/core/recovery/scoreRecovery.cjs"
    },
    locale,
    generated_at_utc: nowUtcIso(),
    inputs: {
      period_days: input.period_days,
      scale: {
        min: 0,
        max: 3,
        labels: input.scale_labels
      },
      role: String(role || 'unknown'),
      section_scores
    },
    summary,
    profile,
    interpretation,
    entitlement: {
      present: Boolean(entitled),
      tier: entitled ? "depth_v1" : "none"
    }
  };
}

module.exports = { buildResultContract };
