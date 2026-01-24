import { B2BDocument } from "../../types/b2b/B2BDocument";

export const industryPacks: B2BDocument = {
  title: "SoftFocus — B2B Industry Packs",
  version: "v1.0",
  audience: "B2B buyers and sales enablement",
  complianceBoundary:
    "All packs are non-clinical and use anonymized aggregation only.",
  sections: [
    {
      heading: "Technology Teams",
      body: [
        "Decision load accumulation.",
        "Cognitive sustainability.",
        "Error cost under fatigue.",
      ],
    },
    {
      heading: "Healthcare Organizations",
      body: [
        "Recovery disruption.",
        "Vigilance sustainability.",
        "Fatigue under time pressure.",
      ],
    },
    {
      heading: "Operations & Safety-Critical",
      body: [
        "Sustained vigilance.",
        "Decision integrity.",
        "Shift-induced degradation.",
      ],
    },
  ],
};
