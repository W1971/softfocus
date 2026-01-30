import { SoftFocusMobileResult } from "@/frontend/types/mobile/SoftFocusMobileResult";
import { adaptMobileResult } from "@/frontend/adapters/mobile/resultAdapter";

type Props = {
  result: SoftFocusMobileResult;
};

export default function MobileResultScreenV2({ result }: Props) {
  const viewModel = adaptMobileResult(result);

  return (
    <section>
      <h1>{viewModel.headline}</h1>

      <p>{viewModel.stageExplanation}</p>

      <p>
        Этот результат предназначен для ориентации и понимания
        текущего состояния нагрузки и восстановления.
        Он не предполагает действий или решений.
      </p>
    </section>
  );
}
