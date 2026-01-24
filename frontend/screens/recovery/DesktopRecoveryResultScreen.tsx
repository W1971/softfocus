import { DesktopRecoveryResult } from "../../types/recovery/RecoveryResultViewModels";

type Props = { model: DesktopRecoveryResult };

export function DesktopRecoveryResultScreen({ model }: Props) {
  return (
    <main style={{ padding: 24, maxWidth: 860 }}>
      <h1>{model.title}</h1>
      <h2>{model.subtitle}</h2>

      <section>
        <h3>Score</h3>
        <p>{model.score} / 100</p>
      </section>

      <section>
        <h3>Penalty Breakdown</h3>
        <ul>
          <li>Sleep: {model.breakdown.sleep}</li>
          <li>Fatigue: {model.breakdown.fatigue}</li>
          <li>Compensation: {model.breakdown.compensation}</li>
          <li>Inertia: {model.breakdown.inertia}</li>
        </ul>
      </section>

      <section>
        <h3>{model.interpretation.heading}</h3>
        <ul>
          {model.interpretation.bullets.map((b, i) => <li key={i}>{b}</li>)}
        </ul>
      </section>

      <hr />
      <small>{model.disclaimer}</small>
    </main>
  );
}
