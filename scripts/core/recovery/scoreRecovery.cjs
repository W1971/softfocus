/**
 * Deterministic recovery scoring core.
 * Runtime-safe. No frontend dependencies.
 */

function scoreRecovery(answers) {
  const penalties =
    answers.sleep * 10 +
    answers.compensation * 8 +
    answers.fatigue * 8 +
    answers.inertia * 6;

  const score = Math.max(0, 100 - penalties);

  let band = "stable";
  if (score < 40) band = "critical";
  else if (score < 60) band = "degraded";
  else if (score < 80) band = "strained";

  return { score, band };
}

module.exports = { scoreRecovery };
