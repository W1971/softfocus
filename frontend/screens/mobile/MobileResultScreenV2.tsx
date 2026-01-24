import { SoftFocusMobileResult } from "../../types/mobile/SoftFocusMobileResult";
import { adaptMobileResult } from "../../adapters/mobile/resultAdapter";
import { mobileResultCopy } from "../../content/mobile/resultCopy";

type Props = {
  result: SoftFocusMobileResult;
};

export function MobileResultScreenV2({ result }: Props) {
  const viewModel = adaptMobileResult(result);
  const cta =
    mobileResultCopy[result.stage.level as keyof typeof mobileResultCopy]?.cta ??
    viewModel.primaryAction;

  return (
    <div>
      <h1>{viewModel.headline}</h1>
      <h2>{viewModel.stageLabel}</h2>
      <p>{viewModel.stageExplanation}</p>
      <button>{cta}</button>
    </div>
  );
}
