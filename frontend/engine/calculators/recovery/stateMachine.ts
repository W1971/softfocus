import { scoreRecovery } from "../../recovery/scoreRecovery";
import type { RecoveryAnswers } from "../../types/recovery/RecoveryAnswers";

export type RecoveryState =
  | { state: "answering" }
  | { state: "scored"; result: ReturnType<typeof scoreRecovery> };

export function evaluateRecovery(
  answers: RecoveryAnswers
): RecoveryState {
  return {
    state: "scored",
    result: scoreRecovery(answers),
  };
}
