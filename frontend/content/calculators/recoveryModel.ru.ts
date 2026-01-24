import { CalculatorDocument } from "../../types/calculator/CalculatorDocument";

export const recoveryModelRU: CalculatorDocument = {
  title: "Модель интерпретации восстановления",
  locale: "ru-RU",
  path: "/kalkulyator-vosstanovleniya/model",
  type: "calculator",
  disclaimer: "non-medical",
  sections: [
    {
      heading: "Ключевая ось",
      body: [
        "выгорание → восстановительная способность → компенсация",
      ],
    },
    {
      heading: "Продуктовый сигнал",
      body: [
        "Низкая recovery capacity указывает на риск выгорания.",
        "Компенсация без восстановления усиливает истощение.",
      ],
    },
  ],
};
