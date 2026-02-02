import type { SoftFocusMobileResult } from "@/frontend/types/mobile/SoftFocusMobileResult";

export type MobileResultViewModel = {
  headline: string;
  stageLabel: string;
  stageExplanation: string;
};

export function adaptMobileResult(
  result: SoftFocusMobileResult
): MobileResultViewModel {
  return {
    headline: result.stage.label,
    stageLabel: result.stage.label,
    stageExplanation: result.stage.descriptor,
  };
}
