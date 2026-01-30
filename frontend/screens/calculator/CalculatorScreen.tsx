import React from "react";
import type { CalculatorDocument } from "@/frontend/types/calculator/CalculatorDocument";

type Props = {
  calculator: CalculatorDocument;
};

export function CalculatorScreen({ calculator }: Props) {
  return (
    <main>
      <header>
        <p>
          Этот инструмент представляет аналитическую модель.
          Он предназначен для углублённого анализа
          и не является рекомендацией или следующим шагом.
        </p>

        <h1>{calculator.title}</h1>
        <p>{calculator.description}</p>
      </header>

      {calculator.sections.map((section) => (
        <section key={section.id}>
          <h2>{section.title}</h2>
          <p>{section.content}</p>
        </section>
      ))}
    </main>
  );
}
