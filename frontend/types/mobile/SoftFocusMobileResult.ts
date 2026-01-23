/**
 * SoftFocus Mobile Result Screen
 * Canonical mobile-only contract
 */

export type SoftFocusMobileResult = {
  resultState: {
    label: string;        // e.g. "Compensated Load"
    descriptor: string;  // short neutral description
  };

  context: string;        // always-visible clarification

  excerpt: {
    title: string;        // e.g. "What this result means"
    items: string[];      // 2–3 short statements
  };

  referenceLink: {
    label: "What SoftFocus Gives";
    target: string;       // internal path
  };

  closingNote?: string;   // optional neutral close
};
