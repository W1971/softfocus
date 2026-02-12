type LegacyQuestion = {
  id: string;
  section: string;
  text: string;
};

const legacy: LegacyQuestion[] = [
  {
    id: "a1",
    section: "latency",
    text: "Как часто сон не восстанавливает ясность мышления к началу рабочего дня?"
  },
  {
    id: "a2",
    section: "latency",
    text: "Как часто вы начинаете работу уже с признаками умственной усталости?"
  },
  {
    id: "b1",
    section: "residual",
    text: "Как часто умственная усталость не снижается после отдыха?"
  }
  // … остальные вопросы
];

export default {
  meta: {
    version: "v1",
    scale: [0, 1, 2, 3]
  },

  sections: legacy.reduce((acc: Record<string, any[]>, q) => {
    if (!acc[q.section]) acc[q.section] = [];

    acc[q.section].push({
      id: q.id,
      text: q.text
    });

    return acc;
  }, {})
};
