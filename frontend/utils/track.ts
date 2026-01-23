export function track(event: string, payload?: Record<string, any>) {
  if (typeof window === "undefined") return;

  fetch("/api/track", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ event, payload })
  }).catch(() => {});
}
