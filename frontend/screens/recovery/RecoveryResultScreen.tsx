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
      <p>
        Этот результат отражает текущее состояние
        соотношения нагрузки и восстановления.
      </p>

      <h1>{result.band}</h1>
      <p>Recovery index: {result.score}</p>
    </section>
  ) : (
    <section>
      <p>
        Ниже приведены аналитические факторы,
        участвующие в формировании результата.
      </p>

      <h1>{result.band}</h1>
      <pre>{JSON.stringify(result.penalties, null, 2)}</pre>
    </section>
  );
}
