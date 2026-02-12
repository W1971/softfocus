import React from "react";

const labels = [
  "Сигнал отсутствует",
  "Эпизодически",
  "Регулярно",
  "Устойчиво"
];

export function AnswerScale({
  value,
  onChange
}: {
  value: number | null;
  onChange: (v: number) => void;
}) {
  return (
    <div className="answer-scale">
      {labels.map((label, i) => (
        <button
          key={i}
          className={value === i ? "active" : ""}
          onClick={() => onChange(i)}
        >
          {label}
        </button>
      ))}
    </div>
  );
}
