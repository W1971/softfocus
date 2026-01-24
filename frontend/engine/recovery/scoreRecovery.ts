import type {
  RecoveryAnswers,
} from "../../types/recovery/RecoveryAnswers";

import type {
  RecoveryScoreResult,
} from "../../types/recovery/RecoveryScore";

/* eslint-disable @typescript-eslint/no-var-requires */
const core: {
  scoreRecovery: (answers: RecoveryAnswers) => RecoveryScoreResult;
} = require("../../../scripts/core/recovery/scoreRecovery.cjs");
/* eslint-enable @typescript-eslint/no-var-requires */

export const scoreRecovery = core.scoreRecovery;
