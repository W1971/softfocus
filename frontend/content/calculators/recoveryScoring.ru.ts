import { CalculatorDocument } from "../../types/calculator/CalculatorDocument";

export const recoveryScoringRU: CalculatorDocument = {
  title: "Логика скоринга восстановления",
  locale: "ru-RU",
  path: "/kalkulyator-vosstanovleniya/scoring",
  type: "calculator",
  disclaimer: "non-medical",
  sections: [
    {
      heading: "Базовый принцип",
      body: [
        "Итоговый балл = 100 − сумма штрафов.",
        "Рост нагрузки и компенсации снижает recovery capacity.",
      ],
    },
    {
      heading: "Компоненты скоринга",
      body: [
        "Сон (0–30)",
        "Компенсация (0–25)",
        "Накопление усталости (0–25)",
        "Инерция (0–20)",
      ],
    },
    {
      heading: "Интерпретация",
      body: [
        "Баллы не являются медицинской оценкой.",
        "Интерпретируются только в контексте нагрузки.",
      ],
    },
  ],
};
