function level(x) {
  // Deterministic bins (Phase D safe): descriptive only.
  if (x >= 2.3) return 'high';
  if (x >= 1.3) return 'medium';
  return 'low';
}

function argMax(obj, keys) {
  let bestK = keys[0];
  let bestV = obj[bestK];
  for (const k of keys) {
    if (obj[k] > bestV) { bestV = obj[k]; bestK = k; }
  }
  return bestK;
}

function stabilityFromPredictability(p) {
  // Predictability section maps to "stability" label (descriptive).
  if (p >= 2.3) return 'unstable';
  if (p >= 1.3) return 'variable';
  return 'stable';
}

function classifyDrivers(section_scores) {
  const keys = ['latency','residual','compensation','predictability','detachment'];

  const dominant_load = argMax(section_scores, ['latency','residual','predictability']);
  const dominant_mechanism = argMax(section_scores, ['compensation','detachment']);
  const stability = stabilityFromPredictability(section_scores.predictability);

  // Choose top 2–4 drivers by magnitude:
  const sorted = keys
    .map(k => ({ k, v: section_scores[k] }))
    .sort((a,b)=>b.v-a.v);

  const top = sorted.slice(0, 3).map(x => ({ key: x.k, level: level(x.v) }));

  return {
    dominant_load,
    dominant_mechanism,
    stability,
    drivers: top
  };
}

module.exports = { classifyDrivers };
