import { SoftFocusMobileResult } from "@/frontend/types/mobile/SoftFocusMobileResult";

export interface MobileResultViewModel {
  resultState: {
    label: string;
    descriptor: string;
  };
  context: string;
  excerpt: {
    title: string;
    items: string[]; // Phase B: variable-length, ordered
  };
  referenceLink: {
    label: string;
    href: string;
  };
}

export function adaptMobileResult(
  result: SoftFocusMobileResult
): MobileResultViewModel {
  return {
    resultState: {
      label: result.stage.label,
      descriptor: result.stage.descriptor,
    },
    context: result.context.summary,
    excerpt: {
      title: result.excerpt.title,
      items: result.excerpt.points.slice(0, 3),
    },
    referenceLink: {
      label: "What SoftFocus Gives",
      href: "/what-softfocus-gives",
    },
  };
}
