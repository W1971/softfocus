import { RecoveryAnswers } from "../types/recovery/RecoveryAnswers";
import { scoreRecovery } from "../engine/recovery/scoreRecovery";
import { useSurface } from "../utils/useSurface";
import {
  toMobileRecoveryResult,
  toDesktopRecoveryResult,
} from "../adapters/recovery/recoveryResultAdapters";

import { MobileResultScreen } from "../screens/mobile/MobileResultScreen";
import { DesktopRecoveryResultScreen } from "../screens/recovery/DesktopRecoveryResultScreen";
import { trackMetric } from "../metrics/trackMetric";

type Props = {
  answers: RecoveryAnswers;
};

export function RecoveryResultController({ answers }: Props) {
  const surface = useSurface();
  const score = scoreRecovery(answers);

  // Passive metrics (allowed)
  trackMetric("result_displayed", {
    surface,
    band: score.band,
  });

  if (surface === "mobile") {
    return <MobileResultScreen screen={toMobileRecoveryResult(score)} />;
  }

  return <DesktopRecoveryResultScreen model={toDesktopRecoveryResult(score)} />;
}
