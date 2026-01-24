import { B2BDocument } from "../../types/b2b/B2BDocument";

export const executiveSummary: B2BDocument = {
  title: "SoftFocus — Executive Summary (B2B)",
  version: "v1.0",
  audience: "Executives, HR, Operations, Risk",
  complianceBoundary:
    "SoftFocus does not provide diagnosis, treatment, or therapeutic services.",
  sections: [
    {
      heading: "The Problem",
      body: [
        "Burnout emerges as declining decision quality and delayed errors.",
        "Traditional tools detect issues too late or rely on self-reporting.",
      ],
    },
    {
      heading: "The SoftFocus Approach",
      body: [
        "A non-clinical, risk-oriented assessment.",
        "Focused on performance sustainability and leading indicators.",
      ],
    },
    {
      heading: "What Organizations Receive",
      body: [
        "Aggregated, anonymized insights.",
        "Burnout stage distribution and dominant risk vectors.",
      ],
    },
    {
      heading: "Core Value",
      body: [
        "Identify where sustainability is at risk before it becomes costly.",
      ],
    },
  ],
};
