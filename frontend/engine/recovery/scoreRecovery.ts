import { RecoveryAnswers, RecoveryQuestionId } from "../../types/recovery/RecoveryAnswers";
import { RecoveryScoreResult, RecoveryPenaltyBreakdown } from "../../types/recovery/RecoveryScore";

function clamp(n: number, min: number, max: number): number {
  return Math.max(min, Math.min(max, n));
}

function sum(answers: RecoveryAnswers, ids: RecoveryQuestionId[]): number {
  let s = 0;
  for (const id of ids) s += answers[id];
  return s;
}

/**
 * Scoring model (deterministic):
 * - Uses operational penalties (not medical norms).
 * - Each block has raw max = 9 (3 questions * max 3).
 * - Penalties scale to block max weights:
 *   sleep 30, compensation 25, fatigue 25, inertia 20.
 * - Score = 100 - sum(penalties).
 *
 * Questions mapping:
 * - Sleep: Q1..Q3
 * - Fatigue accumulation: Q4..Q6
 * - Compensation: Q7..Q9
 * - Inertia: Q10..Q12
 * - Detachment signals Q13..Q15 are interpretation-only (not scored here).
 */
export function scoreRecovery(answers: RecoveryAnswers): RecoveryScoreResult {
  const rawSleep = sum(answers, ["Q1","Q2","Q3"]);
  const rawFatigue = sum(answers, ["Q4","Q5","Q6"]);
  const rawComp = sum(answers, ["Q7","Q8","Q9"]);
  const rawInertia = sum(answers, ["Q10","Q11","Q12"]);

  const penalties: RecoveryPenaltyBreakdown = {
    sleep: Math.round((rawSleep / 9) * 30),
    fatigue: Math.round((rawFatigue / 9) * 25),
    compensation: Math.round((rawComp / 9) * 25),
    inertia: Math.round((rawInertia / 9) * 20),
  };

  const totalPenalty =
    penalties.sleep + penalties.fatigue + penalties.compensation + penalties.inertia;

  const score = clamp(100 - totalPenalty, 0, 100);

  const band: RecoveryScoreResult["band"] =
    score >= 80 ? "stable"
    : score >= 60 ? "strained"
    : score >= 40 ? "degraded"
    : "critical";

  return { score, penalties, band };
}
