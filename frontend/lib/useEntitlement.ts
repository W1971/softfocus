export function useEntitlement(): boolean {
  // Phase D: no UI explanation, no upsell
  if (typeof window === "undefined") return false;
  return window.localStorage.getItem("sf_entitled") === "true";
}
