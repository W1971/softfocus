import SleepCalculator from "./components/SleepCalculator";
import { sleepCalculatorEN } from "@/frontend/content/calculators/sleepCalculator.en";

export const metadata = {
  title: "Sleep Calculator — SoftFocus",
  description:
    "Assessment of recovery and sleep deficit without medical diagnosis or clinical framing",
};

export default function SleepCalculatorPage() {
  return (
    <main style={{ maxWidth: 720, margin: "0 auto", padding: "24px" }}>
      <h1>{sleepCalculatorEN.title}</h1>

      {/* Canonical explanation (non-medical) */}
      {sleepCalculatorEN.sections.map((section, i) => (
        <section key={i}>
          <h2>{section.heading}</h2>
          {section.body.map((line, j) => (
            <p key={j}>{line}</p>
          ))}
        </section>
      ))}

      <hr />

      {/* Interactive calculator */}
      <SleepCalculator />
    </main>
  );
}
