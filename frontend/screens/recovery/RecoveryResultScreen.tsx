import React from "react";
import { ResultContract } from "@/adapters/recovery/ResultContract";

type Props = {
  result: ResultContract;
  onRestart: () => void;
};

export default function RecoveryResultScreen({ result, onRestart }: Props) {
  const { summary, profile, interpretation, entitlement } = result;

  return (
    <div className="recovery-result">
      <h1>Результат оценки</h1>
      <p className="boundary">Неклиническая аналитическая интерпретация</p>

      <section className="state">
        <h2>
          {summary.state === "recovery_closes" && "Восстановление закрывается"}
          {summary.state === "recovery_unstable" && "Восстановление нестабильно"}
          {summary.state === "recovery_does_not_close" && "Восстановление не закрывается"}
        </h2>
      </section>

      <section className="profile">
        <ul>
          <li>Доминирующий источник: {profile.dominant_load}</li>
          <li>Удерживающий механизм: {profile.dominant_mechanism}</li>
          <li>Предсказуемость восстановления: {profile.stability}</li>
        </ul>

        {entitlement.present && profile.drivers && (
          <ul>
            {profile.drivers.map(d => (
              <li key={d.key}>{d.key}: {d.level}</li>
            ))}
          </ul>
        )}
      </section>

      <section className="interpretation">
        {interpretation.body.map((line, i) => (
          <p key={i}>{line}</p>
        ))}
      </section>

      <footer className="actions">
        <button onClick={onRestart}>Повторить оценку</button>
        <button onClick={() => window.location.href = "/"}>Закрыть</button>
      </footer>

      <p className="boundary">
        Неклиническая оценка. Не является медицинским заключением.
      </p>
    </div>
  );
}
