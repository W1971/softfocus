import { sleepCalculatorEN } from "@/frontend/content/calculators/sleepCalculator.en";

export default function SleepCalculatorPage() {
  return (
    <main>
      <p>
        Этот калькулятор является аналитической глубиной.
        Он не предназначен для первичного входа
        и используется после понимания модели SoftFocus.
      </p>

      <h1>{sleepCalculatorEN.title}</h1>

      {sleepCalculatorEN.sections.map((section) => (
        <section key={section.id}>
          <h2>{section.title}</h2>
          <p>{section.content}</p>
        </section>
      ))}
    </main>
  );
}
