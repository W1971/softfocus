export function calculateCompensation({
  recoveryCapacity,
  loadIntensity,
  loadPersistence
}) {
  const capacityFactor = 1 - recoveryCapacity;
  const loadFactor = (loadIntensity + loadPersistence) / 2;

  const compensationScore = Math.min(
    1,
    capacityFactor * loadFactor
  );

  return {
    compensationScore,
    interpretation:
      compensationScore < 0.3
        ? 'Low compensation pressure'
        : compensationScore < 0.6
        ? 'Moderate compensation pressure'
        : 'High compensation pressure'
  };
}
