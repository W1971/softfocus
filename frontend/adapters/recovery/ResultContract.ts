export type RecoveryState =
  | "recovery_closes"
  | "recovery_unstable"
  | "recovery_does_not_close";

export type ConfidenceLevel = "low" | "medium" | "high";

export interface ResultContract {
  contract_version: "1.0";
  phase: "phase-d";
  boundary: "non-clinical";

  model: {
    name: "recovery-capacity-v1";
    version: "v1";
    source_of_truth: string;
  };

  locale: string;
  generated_at_utc: string;

  inputs: {
    period_days: number;
    scale: {
      min: 0;
      max: 3;
      labels: string[];
    };
    role: string;
    section_scores: Record<string, number>;
  };

  summary: {
    state: RecoveryState;
    confidence: ConfidenceLevel;
  };

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

  entitlement: {
    present: boolean;
    tier: "none" | "depth_v1";
  };
}
