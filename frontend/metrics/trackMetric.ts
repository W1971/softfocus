import { SoftFocusMetric } from "./metricsSchema";

/**
 * Metrics are observational only.
 * No feedback loops.
 * No behavior shaping.
 */
export function trackMetric(
  type: SoftFocusMetric["type"],
  payload: Omit<SoftFocusMetric, "type">
) {
  const event = {
    type,
    payload,
    ts: new Date().toISOString(),
  };

  // Replace with server-side logging if needed
  console.debug("[SoftFocus metric]", event);
}
