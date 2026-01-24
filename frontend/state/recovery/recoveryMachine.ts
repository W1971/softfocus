import { RecoveryAnswers, RecoveryAnswerValue, RecoveryQuestionId } from "../../types/recovery/RecoveryAnswers";
import { scoreRecovery } from "../../engine/recovery/scoreRecovery";
import { RecoveryScoreResult } from "../../types/recovery/RecoveryScore";

export type RecoveryStep =
  | "intro"
  | "A_latency"
  | "B_residual_fatigue"
  | "C_compensation"
  | "D_predictability_inertia"
  | "E_detachment"
  | "review"
  | "result";

export type RecoveryState = {
  step: RecoveryStep;
  answers: RecoveryAnswers;
};

export type RecoveryEvent =
  | { type: "START" }
  | { type: "ANSWER"; id: RecoveryQuestionId; value: RecoveryAnswerValue }
  | { type: "NEXT" }
  | { type: "BACK" }
  | { type: "RESET" };

export const RECOVERY_STEPS: RecoveryStep[] = [
  "intro",
  "A_latency",
  "B_residual_fatigue",
  "C_compensation",
  "D_predictability_inertia",
  "E_detachment",
  "review",
  "result",
];

export const STEP_QUESTIONS: Record<RecoveryStep, RecoveryQuestionId[]> = {
  intro: [],
  A_latency: ["Q1","Q2","Q3"],
  B_residual_fatigue: ["Q4","Q5","Q6"],
  C_compensation: ["Q7","Q8","Q9"],
  D_predictability_inertia: ["Q10","Q11","Q12"],
  E_detachment: ["Q13","Q14","Q15"],
  review: [],
  result: [],
};

export function makeEmptyAnswers(): RecoveryAnswers {
  return {
    Q1:0,Q2:0,Q3:0,Q4:0,Q5:0,Q6:0,Q7:0,Q8:0,Q9:0,Q10:0,Q11:0,Q12:0,Q13:0,Q14:0,Q15:0,
  };
}

export function initialRecoveryState(): RecoveryState {
  return { step: "intro", answers: makeEmptyAnswers() };
}

function stepIndex(step: RecoveryStep): number {
  return RECOVERY_STEPS.indexOf(step);
}

function goToStep(state: RecoveryState, step: RecoveryStep): RecoveryState {
  return { ...state, step };
}

export function recoveryReducer(state: RecoveryState, event: RecoveryEvent): RecoveryState {
  switch (event.type) {
    case "RESET":
      return initialRecoveryState();

    case "START":
      return goToStep(state, "A_latency");

    case "ANSWER":
      return {
        ...state,
        answers: { ...state.answers, [event.id]: event.value },
      };

    case "NEXT": {
      const i = stepIndex(state.step);
      const next = RECOVERY_STEPS[Math.min(i + 1, RECOVERY_STEPS.length - 1)];
      return goToStep(state, next);
    }

    case "BACK": {
      const i = stepIndex(state.step);
      const prev = RECOVERY_STEPS[Math.max(i - 1, 0)];
      return goToStep(state, prev);
    }

    default:
      return state;
  }
}

/** Selectors (pure) */
export function isStepComplete(state: RecoveryState, step: RecoveryStep): boolean {
  const ids = STEP_QUESTIONS[step];
  // We allow 0..3 everywhere; "complete" means every question is present (always true),
  // but you can change this later if you want "unanswered" = null.
  return ids.length === 0 ? true : ids.every((id) => typeof state.answers[id] === "number");
}

export function computeRecoveryResult(state: RecoveryState): RecoveryScoreResult {
  return scoreRecovery(state.answers);
}
