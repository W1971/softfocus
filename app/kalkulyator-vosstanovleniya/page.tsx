import { CalculatorScreen } from "@/frontend/screens/calculator/CalculatorScreen";
import { recoveryOverviewRU } from "@/frontend/content/calculators/recoveryOverview.ru";

export default function RecoveryCalculatorPage() {
  return (
    <main>
      <p>
        Этот раздел представляет аналитическую модель восстановления.
        Он предназначен для углублённого анализа
        после интерпретации результатов SoftFocus.
      </p>

      <CalculatorScreen calculator={recoveryOverviewRU} />
    </main>
  );
}
