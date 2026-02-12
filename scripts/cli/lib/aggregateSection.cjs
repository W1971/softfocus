function clamp(n, min, max) {
  return Math.max(min, Math.min(max, n));
}

function aggregateSection(values) {
  const nums = values.map(v => Number(v)).filter(v => Number.isFinite(v));
  if (nums.length === 0) return 0;
  const sum = nums.reduce((a,b)=>a+b,0);
  const avg = sum / nums.length;
  return clamp(Number(avg.toFixed(2)), 0, 3);
}

module.exports = { aggregateSection };
