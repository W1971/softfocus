// app/kalkulyator-sna/lib/data.ts

export const ASSESSMENT_VERSION = "v2.0";

export const RETURN_SIGNAL_TEMPLATE =
  "Reassessment becomes informative after sustained changes in sleep or cognitive load over several weeks.";

export type Question = {
  id: string;
  title: string;
  options: {
    id: string;
    label: string;
    score: number;
  }[];
};

/* =========================
   BLOCK 1 — SLEEP (RECOVERY)
   ========================= */

export const SLEEP_QUESTIONS: Question[] = [
  {
    id: "sleep_duration",
    title: "Средняя продолжительность сна за последние 7 дней",
    options: [
      { id: "lt_5_30", label: "меньше 5:30", score: 3 },
      { id: "5_30_6_30", label: "5:30–6:30", score: 2 },
      { id: "6_30_7_30", label: "6:30–7:30", score: 1 },
      { id: "7_30_8_30", label: "7:30–8:30", score: 0 },
      { id: "gt_8_30", label: "больше 8:30", score: 0 }
    ]
  },
  {
    id: "sleep_variability",
    title: "Насколько стабилен был режим сна",
    options: [
      { id: "very_unstable", label: "сильно менялся", score: 2 },
      { id: "somewhat_unstable", label: "умеренно нестабилен", score: 1 },
      { id: "stable", label: "в целом стабилен", score: 0 }
    ]
  },
  {
    id: "sleep_compensation",
    title: "Как часто возникала потребность компенсировать недосып",
    options: [
      { id: "often", label: "часто", score: 2 },
      { id: "sometimes", label: "иногда", score: 1 },
      { id: "rarely", label: "редко или не было", score: 0 }
    ]
  }
];

/* =========================
   BLOCK 2 — COGNITIVE LOAD
   ========================= */

export const LOAD_QUESTIONS: Question[] = [
  {
    id: "decision_cost",
    title: "Как часто решения имели высокую стоимость ошибки",
    options: [
      { id: "very_often", label: "очень часто", score: 3 },
      { id: "often", label: "часто", score: 2 },
      { id: "sometimes", label: "иногда", score: 1 },
      { id: "rarely", label: "редко", score: 0 }
    ]
  },
  {
    id: "context_depth",
    title: "Как часто требовалось удерживать сложные контексты длительное время",
    options: [
      { id: "constantly", label: "практически постоянно", score: 3 },
      { id: "often", label: "часто", score: 2 },
      { id: "sometimes", label: "иногда", score: 1 },
      { id: "rarely", label: "редко", score: 0 }
    ]
  },
  {
    id: "workday_extension",
    title: "Как часто рабочий день приходилось продлевать для сохранения качества",
    options: [
      { id: "often", label: "часто", score: 2 },
      { id: "sometimes", label: "иногда", score: 1 },
      { id: "rarely", label: "редко", score: 0 }
    ]
  }
];

/* =========================
   MERGED FLOW
   ========================= */

export const QUESTIONS: Question[] = [
  ...SLEEP_QUESTIONS,
  ...LOAD_QUESTIONS
];

/* =========================
   CLASSIFICATION v2
   ========================= */

export type BurnoutState =
  | "STABLE_RECOVERY"
  | "COMPENSATED_LOAD"
  | "RECOVERY_DEBT"
  | "SYSTEMIC_DEFICIT";

export function classify(
  sleepScore: number,
  loadScore: number
): BurnoutState {
  const recoveryBalance = sleepScore - loadScore;

  if (recoveryBalance >= 2) return "STABLE_RECOVERY";
  if (recoveryBalance >= 0) return "COMPENSATED_LOAD";
  if (recoveryBalance >= -2) return "RECOVERY_DEBT";
  return "SYSTEMIC_DEFICIT";
}
