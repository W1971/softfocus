import { DesktopRecoveryResult } from "../../types/recovery/RecoveryResultViewModels";

type Props = { model: DesktopRecoveryResult };

export function DesktopRecoveryResultScreen({ model }: Props) {
  return (
    <main style={{ padding: 24, maxWidth: 860 }}>
      <p>
        Ниже представлен аналитический результат.
        Он описывает текущее соотношение нагрузки,
        восстановления и компенсации
        и не задаёт норм или рекомендаций.
      </p>

      <h1>{model.title}</h1>
      <h2>{model.subtitle}</h2>

      <section>
        <h3>Recovery Index</h3>
        <p>{model.score} / 100</p>
      </section>

      <section>
        <h3>Contributing Factors</h3>
        <ul>
          <li>Sleep contribution: {model.breakdown.sleep}</li>
          <li>Fatigue contribution: {model.breakdown.fatigue}</li>
          <li>Compensation contribution: {model.breakdown.compensation}</li>
          <li>Inertia contribution: {model.breakdown.inertia}</li>
        </ul>
      </section>

      <section>
        <h3>{model.interpretation.heading}</h3>
        <ul>
          {model.interpretation.bullets.map((b, i) => (
            <li key={i}>{b}</li>
          ))}
        </ul>
      </section>

      <hr />
      <small>{model.disclaimer}</small>
    </main>
  );
}
