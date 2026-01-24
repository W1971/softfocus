import { SoftFocusMobileResult } from "../../types/mobile/SoftFocusMobileResult";

export type MobileResultViewModel = {
  headline: string;
  stageLabel: string;
  stageExplanation: string;
  primaryAction: string;
};

export function adaptMobileResult(
  result: SoftFocusMobileResult
): MobileResultViewModel {
  return {
    headline: result.summary.title,
    stageLabel: result.stage.label,
    stageExplanation: result.stage.explanation,
    primaryAction: result.recommendation.primary,
  };
}
