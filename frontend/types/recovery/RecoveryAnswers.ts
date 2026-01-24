export type RecoveryQuestionId =
  | "Q1" | "Q2" | "Q3"
  | "Q4" | "Q5" | "Q6"
  | "Q7" | "Q8" | "Q9"
  | "Q10" | "Q11" | "Q12"
  | "Q13" | "Q14" | "Q15";

export type RecoveryAnswerValue = 0 | 1 | 2 | 3;

export type RecoveryAnswers = Record<RecoveryQuestionId, RecoveryAnswerValue>;
