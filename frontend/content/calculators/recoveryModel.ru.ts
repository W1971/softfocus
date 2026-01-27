import { CalculatorDocument } from "@/frontend/types/calculator/CalculatorDocument";

export const recoveryModelRU: CalculatorDocument = {
  title: "Модель интерпретации восстановления",
  description:
    "Интерпретационная модель, объясняющая результаты оценки восстановления без клинической диагностики.",
  sections: [
    {
      id: "overview",
      title: "Общее описание",
      content:
        "Модель восстановления SoftFocus предназначена для оценки устойчивости и риска истощения в условиях длительной когнитивной нагрузки.",
    },
    {
      id: "principles",
      title: "Ключевые принципы",
      content:
        "Модель не диагностирует и не лечит. Она описывает наблюдаемые паттерны нагрузки и восстановления.",
    },
  ],
};
