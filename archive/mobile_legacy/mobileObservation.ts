export type MobileObservationEvent =
  | { type: "impression" }
  | { type: "read" }
  | { type: "reference_click" };

export function observeMobile(event: MobileObservationEvent) {
  // intentionally passive
  // no optimization, no feedback loop
  // audit-only signal
  console.debug("[mobile-observation]", event);
}
