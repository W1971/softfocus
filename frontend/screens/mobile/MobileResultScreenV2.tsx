import { SoftFocusMobileResult } from "@/frontend/types/mobile/SoftFocusMobileResult";
import { adaptMobileResult } from "@/frontend/adapters/mobile/resultAdapter";
import { mobileResultCopy } from "@/frontend/content/mobile/resultCopy";

type Props = {
  result: SoftFocusMobileResult;
};

export default function MobileResultScreenV2({ result }: Props) {
  const viewModel = adaptMobileResult(result);

  const cta = mobileResultCopy.cta.primary;

  return (
    <section>
      <h1>{viewModel.headline}</h1>

      <p>{viewModel.stageExplanation}</p>

      <button>{cta}</button>
    </section>
  );
}
