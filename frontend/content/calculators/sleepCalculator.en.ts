import { CalculatorDocument } from "@/frontend/types/calculator/CalculatorDocument";

export const sleepCalculatorEN: CalculatorDocument = {
  title: "Sleep-Based Recovery Assessment",
  description:
    "A calculator that interprets recovery signals based on sleep duration and quality patterns.",
  sections: [
    {
      id: "purpose",
      title: "Purpose",
      content:
        "This calculator assesses recovery state based on sleep patterns. It describes recovery deficit and sustainability risk, not medical or health conditions.",
    },
    {
      id: "inputs",
      title: "Inputs",
      content:
        "Inputs include average sleep duration, perceived sleep quality, and consistency over recent weeks.",
    },
    {
      id: "interpretation",
      title: "How to Interpret Results",
      content:
        "Results reflect how effectively sleep supports cognitive and physiological recovery under current load.",
    },
  ],
};
