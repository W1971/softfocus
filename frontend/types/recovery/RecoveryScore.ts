export type RecoveryPenaltyBreakdown = {
  sleep: number;         // 0..30
  compensation: number;  // 0..25
  fatigue: number;       // 0..25
  inertia: number;       // 0..20
};

export type RecoveryScoreResult = {
  score: number; // 0..100
  penalties: RecoveryPenaltyBreakdown;
  band: "stable" | "strained" | "degraded" | "critical";
};
