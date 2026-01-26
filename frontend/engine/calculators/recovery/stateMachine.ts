import { scoreRecovery } from "@/frontend/engine/recovery/scoreRecovery";
import type { RecoveryAnswers } from "@/frontend/types/recovery/RecoveryAnswers";

export type RecoveryState =
  | { state: "answering" }
  | { state: "calculating" }
  | { state: "result"; score: number };

export function recoveryStateMachine(
  answers: RecoveryAnswers
): RecoveryState {
  if (!answers) {
    return { state: "answering" };
  }

  const result = scoreRecovery(answers);

  return {
    state: "result",
    score: result.score,
  };
}
