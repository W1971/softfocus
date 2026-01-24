import { MobileResultScreen } from "../../types/mobile/MobileResultScreen";
import { SoftFocusMobileResult } from "../../types/mobile/SoftFocusMobileResult";

export function adaptToMobileResultScreen(
  result: SoftFocusMobileResult
): MobileResultScreen {
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
      target: "/what-softfocus-gives",
    },
    closingNote: result.closingNote,
  };
}
