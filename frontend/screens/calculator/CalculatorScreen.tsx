import { CalculatorDocument } from "../../types/calculator/CalculatorDocument";

type Props = {
  calculator: CalculatorDocument;
};

export function CalculatorScreen({ calculator }: Props) {
  return (
    <main style={{ padding: 24, maxWidth: 720 }}>
      <h1>{calculator.title}</h1>

      {calculator.sections.map((section, i) => (
        <section key={i}>
          <h2>{section.heading}</h2>
          {section.body.map((line, j) => (
            <p key={j}>{line}</p>
          ))}
        </section>
      ))}

      {calculator.disclaimer && (
        <small>{calculator.disclaimer}</small>
      )}
    </main>
  );
}
