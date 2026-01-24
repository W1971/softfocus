import { SoftFocusMobileResult } from "./SoftFocusMobileResult";

export function isSoftFocusMobileResult(
  value: unknown
): value is SoftFocusMobileResult {
  return (
    typeof value === "object" &&
    value !== null &&
    "summary" in value &&
    "stage" in value &&
    "recommendation" in value
  );
}
