import { CalculatorScreen } from "@/frontend/screens/calculator/CalculatorScreen";
import { recoveryScoringRU } from "@/frontend/content/calculators/recoveryScoring.ru";

export default function RecoveryScoringPage() {
  return <CalculatorScreen calculator={recoveryScoringRU} />;
}
