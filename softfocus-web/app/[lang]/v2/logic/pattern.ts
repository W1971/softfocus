type Dimensions = {
  A: number;
  B: number;
  C: number;
  density: number;
  imbalance: number;
};

export function analyze(answers: (number | null)[]): Dimensions {
  const A = avg(answers.slice(0, 18));
  const B = avg(answers.slice(18, 36));
  const C = avg(answers.slice(36, 54));

  const density = (A + B + C) / 3;
  const imbalance = Math.max(A, B, C) - Math.min(A, B, C);

  return { A, B, C, density, imbalance };
}

export function detectPattern(data: Dimensions) {
  const { A, B, C, density, imbalance } = data;

  if (density < 1) return "Low structural strain";

  if (imbalance > 1) {
    if (C > A && C > B)
      return "Fragmentation exceeds system stability";

    if (B > A && B > C)
      return "Compensatory control dominates";

    if (A > B && A > C)
      return "Load volatility destabilizes structure";
  }

  if (density > 2)
    return "High-density structural overload";

  return "Compensated instability";
}

function avg(arr: (number | null)[]) {
  return arr.reduce((a, b) => a + (b ?? 0), 0) / arr.length;
}
