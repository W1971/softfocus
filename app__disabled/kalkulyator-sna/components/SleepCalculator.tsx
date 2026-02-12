"use client";

import { useState } from "react";
import { QUESTIONS, classify } from "../lib/data";
import { RESULT_COPY } from "../lib/resultCopy";

export default function SleepCalculator() {
  const [step, setStep] = useState(0);
  const [answers, setAnswers] = useState<Record<string, number>>({});

  const question = QUESTIONS[step];
  const completed = step >= QUESTIONS.length;
  
  const sleepScore = Object.entries(answers)
  .filter(([id]) =>
    QUESTIONS.find(q => q.id === id && q.id.startsWith("sleep"))
  )
  .reduce((a, [, b]) => a + b, 0);

const loadScore = Object.entries(answers)
  .filter(([id]) =>
    QUESTIONS.find(q => q.id === id && !q.id.startsWith("sleep"))
  )
  .reduce((a, [, b]) => a + b, 0);


  const reset = () => {
    setStep(0);
    setAnswers({});
  };

  return (
  <main
  style={{
    maxWidth: 680,              // было 720
    margin: "0 auto",
    padding: "96px 24px 80px",  // больше воздуха сверху
    lineHeight: 1.65
  }}
>

      {/* ===== HERO / PATTERN HEADER ===== */}
      <header style={{ marginBottom: 48 }}>
        <h1
  style={{
    fontSize: 44,
    fontWeight: 600,
    letterSpacing: "-0.02em",
    marginBottom: 24
  }}
>

          Калькулятор сна
        </h1>

        <p
  style={{
    fontSize: 20,
    maxWidth: 600,
    marginBottom: 12
  }}
>

          Структурированный инструмент ориентации по восстановлению
          при текущем режиме сна за последние 7 дней.
        </p>

        <p
  style={{
    fontSize: 14,
    opacity: 0.55
  }}
>

          Без норм. Без диагнозов. Без медицинской лексики.
        </p>

        <div style={{ marginTop: 32, fontSize: 14 }}>
          <strong>Как интерпретируется результат</strong>
          <ul style={{ marginTop: 8, paddingLeft: 18 }}>
            <li>Состояние — отражает, закрывается ли восстановление.</li>
            <li>Риск — показывает последствия сохранения режима.</li>
            <li>Возврат — указывает, когда повторная оценка осмысленна.</li>
          </ul>
        </div>
      </header>

      {/* ===== RESULT VIEW ===== */}
      {completed ? (() => {
        const state = classify(sleepScore, loadScore);
        const result = RESULT_COPY[state];

        return (
          <section>
            <h2
              style={{
                fontSize: 28,
                fontWeight: 600,
                marginBottom: 32
              }}
            >
              {result.title}
            </h2>

            <div style={{ marginBottom: 24 }}>
              <h3 style={{ fontSize: 16, textTransform: "uppercase", opacity: 0.7 }}>
                Интерпретация
              </h3>
              <p>{result.interpretation}</p>
            </div>

            <div style={{ marginBottom: 24 }}>
              <h3 style={{ fontSize: 16, textTransform: "uppercase", opacity: 0.7 }}>
                Основной риск
              </h3>
              <p>{result.risk}</p>
            </div>

            <div>
              <h3 style={{ fontSize: 16, textTransform: "uppercase", opacity: 0.7 }}>
                Когда имеет смысл вернуться
              </h3>
              <p>{result.return}</p>
            </div>

            {process.env.NODE_ENV === "development" && (
              <div style={{ marginTop: 24, fontSize: 12, opacity: 0.4 }}>
                Debug: state={state}, sleep={sleepScore}, load={loadScore}

              </div>
            )}
<p
  style={{
    marginTop: 32,
    fontSize: 14,
    opacity: 0.6
  }}
>
  Эта оценка отражает текущее соотношение сна и нагрузки.
  Она становится информативнее при повторе после устойчивых изменений.
</p>

            <button
              onClick={reset}
              style={{
                marginTop: 32,
                padding: "8px 16px",
                background: "transparent",
                border: "1px solid #ccc",
                borderRadius: 4,
                cursor: "pointer"
              }}
            >
              Пересчитать
            </button>
          </section>
        );
      })() : (
        /* ===== QUESTION VIEW ===== */
        <section>
          <p>
            Вопрос {step + 1} из {QUESTIONS.length}
          </p>

          <h2>{question.title}</h2>

          <ul>
            {question.options.map(opt => (
              <li key={opt.id}>
                <button
                  onClick={() => {
                    setAnswers(prev => ({
                      ...prev,
                      [question.id]: opt.score
                    }));
                    setStep(step + 1);
                  }}
                >
                  {opt.label}
                </button>
              </li>
            ))}
          </ul>
        </section>
      )}
    </main>
  );
}
