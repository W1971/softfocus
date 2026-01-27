/**
 * SoftFocus — Recovery Scoring v1 (Shim)
 *
 * Purpose:
 *   Provide a stable import path for backend/api/* code that expects:
 *     core/recovery/scoreRecovery.cjs
 *
 * Source of truth:
 *   scripts/core/recovery/scoreRecovery.cjs (frozen, governed)
 */

"use strict";

let impl;
try {
  // Canonical frozen implementation (v1)
  impl = require("../../scripts/core/recovery/scoreRecovery.cjs");
} catch (e) {
  // Fail fast with a deterministic error
  const msg =
    "[CORE][FAIL] Cannot load canonical Recovery Scoring implementation at scripts/core/recovery/scoreRecovery.cjs. " +
    "This path is required in Phase B. Original error: " +
    (e && e.message ? e.message : String(e));
  throw new Error(msg);
}

if (!impl || typeof impl.scoreRecovery !== "function") {
  throw new Error(
    "[CORE][FAIL] Invalid Recovery Scoring module: expected { scoreRecovery: function }. " +
      "Check scripts/core/recovery/scoreRecovery.cjs exports."
  );
}

module.exports = {
  scoreRecovery: impl.scoreRecovery
};
