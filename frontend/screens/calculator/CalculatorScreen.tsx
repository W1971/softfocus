import React from "react";
import type { CalculatorDocument } from "@/frontend/types/calculator/CalculatorDocument";

type Props = {
  calculator: CalculatorDocument;
};

export function CalculatorScreen({ calculator }: Props) {
  return (
    <main>
      <header>
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
