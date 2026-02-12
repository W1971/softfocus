import React from "react";

export function QuestionCard({
  text,
  index,
  total
}: {
  text: string;
  index: number;
  total: number;
}) {
  return (
    <div className="question-card">
      <p className="progress">
        Вопрос {index + 1} из {total}
      </p>
      <h2>{text}</h2>
    </div>
  );
}
