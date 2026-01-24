import { CalculatorDocument } from "../../types/calculator/CalculatorDocument";

export const sleepCalculatorEN: CalculatorDocument = {
  title: "Sleep Calculator: Recovery and Deficit",
  locale: "en-US",
  path: "/kalkulyator-sna",
  type: "calculator",
  intent: "high",
  tone: "analytical",
  disclaimer: "non-medical",
  sections: [
    {
      heading: "Purpose",
      body: [
        "Assess recovery state based on sleep patterns.",
        "Describe recovery deficit, not health condition.",
      ],
    },
    {
      heading: "What you receive",
      body: [
        "Burnout stage from a recovery perspective.",
        "Primary risk under current cognitive load.",
      ],
    },
    {
      heading: "Limitations",
      body: [
        "Not a medical tool.",
        "Does not replace clinical support.",
      ],
    },
  ],
};
