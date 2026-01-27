import { useEffect } from "react";
import { SoftFocusMobileResult } from "@/frontend/types/mobile/SoftFocusMobileResult";
import { track } from "@/frontend/utils/track";

type Props = {
  result: SoftFocusMobileResult;
};

export function MobileResultScreen({ result }: Props) {
  useEffect(() => {
    track("mobile_result_viewed", {
      stage: result.stage.label,
    });
  }, [result]);

  return (
    <div>
      <h1>{result.stage.label}</h1>
      <p>{result.stage.descriptor}</p>
    </div>
  );
}
