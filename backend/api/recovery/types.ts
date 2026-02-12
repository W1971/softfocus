export type RecoveryEvaluateRequest = {
  answers: Record<string, 0 | 1 | 2 | 3>;
  locale: string;
  role: string;
};

export type RecoveryEvaluateResponse = {
  periodDays: number;

  scale: {
    min: 0;
    max: 3;
    labels: string[];
  };

  sectionScores: {
    latency: number;
    residual: number;
    compensation: number;
    predictability: number;
    detachment: number;
  };

  state: "recovery_closes" | "recovery_unstable" | "recovery_does_not_close";
  confidence: "low" | "medium" | "high";

  profile: {
    dominant_load: string;
    dominant_mechanism: string;
    stability: string;
    drivers?: Array<{
      key: string;
      level: "low" | "medium" | "high";
    }>;
  };

  interpretation: {
    headline: string;
    body: string[];
  };
};
