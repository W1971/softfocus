import React from "react";
import RecoveryResultScreen from "./RecoveryResultScreen";
import { ResultContract } from "@/adapters/recovery/ResultContract";

type Props = {
  result: ResultContract;
  onRestart: () => void;
};

export default function DesktopRecoveryResultScreen(props: Props) {
  return (
    <div className="desktop-recovery-result">
      <RecoveryResultScreen {...props} />
    </div>
  );
}
