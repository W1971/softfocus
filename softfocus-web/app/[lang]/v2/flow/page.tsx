"use client";

import { questions } from "../questions";
import { useAssessment } from "../state/AssessmentContext";

export default function Flow() {
  const { step, answers, setAnswer, next, prev } = useAssessment();

  const handleAnswer = (value: number) => {
    setAnswer(step, value);
    next();
  };

  return (
    <div className="flow-container">

      {/* Progress */}
      <div className="progress-bar">
        <div
          className="progress-fill"
          style={{
            width: `${(step / (questions.length - 1)) * 100}%`,
          }}
        />
      </div>

      {/* Question */}
      <h2 className="question">
        {questions[step]}
      </h2>

      {/* Scale */}
      <div className="scale">
        {[0, 1, 2, 3].map((value) => (
          <button
            key={value}
            className={`dot ${
              answers[step] === value ? "active" : ""
            }`}
            onClick={() => handleAnswer(value)}
          />
        ))}
      </div>

      {/* Back */}
      {step > 0 && (
        <button className="back" onClick={prev}>
          Back
        </button>
      )}

    </div>
  );
}
