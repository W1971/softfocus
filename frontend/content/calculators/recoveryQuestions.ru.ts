import { CalculatorDocument } from "@/frontend/types/calculator/CalculatorDocument";

export const recoveryQuestionsRU: CalculatorDocument = {
  title: "Вопросы оценки восстановления",
  description:
    "Набор вопросов для самооценки уровня восстановления и накопленной нагрузки.",
  sections: [
    {
      id: "scale",
      title: "Шкала ответов",
      content:
        "0 — сигнал отсутствует. 1 — эпизодически. 2 — регулярно. 3 — постоянно.",
    },
    {
      id: "instructions",
      title: "Как отвечать",
      content:
        "Отвечайте, опираясь на своё состояние за последние 2–3 недели, а не на единичные эпизоды.",
    },
    {
      id: "note",
      title: "Важно",
      content:
        "Оценка субъективна и предназначена для самонаблюдения, а не для клинической диагностики.",
    },
  ],
};
