import { CalculatorDocument } from "../../types/calculator/CalculatorDocument";

export const recoveryQuestionsRU: CalculatorDocument = {
  title: "Калькулятор восстановления — вопросы оценки",
  locale: "ru-RU",
  path: "/kalkulyator-vosstanovleniya",
  type: "calculator",
  intent: "high",
  tone: "analytical",
  disclaimer: "non-medical",
  sections: [
    {
      heading: "Шкала ответов",
      body: [
        "0 — сигнал отсутствует",
        "1 — эпизодически",
        "2 — регулярно",
        "3 — устойчиво / структурно",
        "Период оценки: последние 14 дней",
      ],
    },
    {
      heading: "Раздел A — Латентность восстановления",
      body: [
        "Сон не восстанавливает ясность мышления.",
        "Работа начинается с усталости.",
        "Восстановление занимает больше времени.",
      ],
    },
    {
      heading: "Раздел B — Остаточная усталость",
      body: [
        "Усталость сохраняется после отдыха.",
        "Концентрация ухудшается раньше ожидаемого.",
      ],
    },
  ],
};
