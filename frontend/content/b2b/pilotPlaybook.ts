import { B2BDocument } from "../../types/b2b/B2BDocument";

export const pilotPlaybook: B2BDocument = {
  title: "SoftFocus — B2B Pilot Playbook (30–60–90 Days)",
  version: "v1.0",
  audience: "B2B stakeholders",
  complianceBoundary:
    "SoftFocus is non-clinical and does not provide medical or mental health services.",
  sections: [
    {
      heading: "Days 0–30 — Baseline",
      body: [
        "Define pilot scope.",
        "Deploy assessment link.",
        "Collect anonymized responses.",
      ],
    },
    {
      heading: "Days 31–60 — Interpretation",
      body: [
        "Analyze aggregated results.",
        "Identify risk concentrations.",
        "Prepare management-level brief.",
      ],
    },
    {
      heading: "Days 61–90 — Decision Support",
      body: [
        "Optional reassessment.",
        "Compare longitudinal patterns.",
        "Go / no-go recommendation.",
      ],
    },
  ],
};
