import { ResultContract } from "./ResultContract";

export function adaptRecoveryToResultContract(
  raw: any,
  options: {
    locale: string;
    role: string;
    entitlement: boolean;
  }
): ResultContract {
  return {
    contract_version: "1.0",
    phase: "phase-d",
    boundary: "non-clinical",

    model: {
      name: "recovery-capacity-v1",
      version: "v1",
      source_of_truth: "engine/recovery/scoreRecovery.ts"
    },

    locale: options.locale,
    generated_at_utc: new Date().toISOString(),

    inputs: {
      period_days: raw.periodDays ?? 14,
      scale: raw.scale ?? {
        min: 0,
        max: 3,
        labels: [
          "Сигнал отсутствует",
          "Эпизодически",
          "Регулярно",
          "Устойчиво"
        ]
      },
      role: options.role,
      section_scores: raw.sectionScores
    },

    summary: {
      state: raw.state,
      confidence: raw.confidence ?? "medium"
    },

    profile: raw.profile,

    interpretation: raw.interpretation,

    entitlement: {
      present: options.entitlement,
      tier: options.entitlement ? "depth_v1" : "none"
    }
  };
}
