import type { RecoveryScoreResult } from "../../types/recovery/RecoveryScore";

export function RecoveryResultScreen({
  result,
  variant,
}: {
  result: RecoveryScoreResult;
  variant: "mobile" | "desktop";
}) {
  return variant === "mobile" ? (
    <section>
      <h1>{result.band}</h1>
      <p>{result.score}</p>
    </section>
  ) : (
    <section>
      <h1>{result.band}</h1>
      <pre>{JSON.stringify(result.penalties, null, 2)}</pre>
    </section>
  );
}
