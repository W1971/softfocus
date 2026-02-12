export async function emitAudit(event: {
  type: "assessment_run";
  role: string;
  locale: string;
  entitled: boolean;
}) {
  await fetch("/api/audit/run", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(event)
  });
}
