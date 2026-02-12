import { adaptRecoveryToResultContract } from "@/adapters/recovery/adaptRecoveryToResultContract";

export async function runAssessment({
  answers,
  locale,
  role,
  entitlement
}: {
  answers: Record<string, number>;
  locale: string;
  role: string;
  entitlement: boolean;
}) {
  const res = await fetch("/api/recovery/evaluate", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      answers,
      locale,
      role
    })
  });

  if (!res.ok) {
    throw new Error("Assessment evaluation failed");
  }

  const raw = await res.json();

  return adaptRecoveryToResultContract(raw, {
    locale,
    role,
    entitlement
  });
}
