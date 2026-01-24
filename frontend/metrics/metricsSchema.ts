export type SoftFocusMetric =
  | {
      type: "assessment_started";
    }
  | {
      type: "assessment_completed";
    }
  | {
      type: "result_displayed";
      band:
        | "stable"
        | "strained"
        | "degraded"
        | "critical";
      surface: "mobile" | "desktop";
    }
  | {
      type: "return_signal_displayed";
    }
  | {
      type: "reassessment_triggered";
    }
  | {
      type: "context_variant";
      variant: "default" | "founder_high_load";
    };
