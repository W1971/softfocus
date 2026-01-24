import { RecoveryScoreResult } from "../../types/recovery/RecoveryScore";
import { MobileResultScreen } from "../../types/mobile/MobileResultScreen";
import { DesktopRecoveryResult } from "../../types/recovery/RecoveryResultViewModels";

/**
 * Copy is deliberately neutral and non-medical.
 * Mobile: no numbers, no actions, no urgency.
 * Desktop: allows numeric breakdown as operational signals.
 */

function bandToMobileLabel(band: RecoveryScoreResult["band"]): { label: string; descriptor: string } {
  switch (band) {
    case "stable":
      return { label: "Стабильное восстановление", descriptor: "Нагрузка пока не разрушает восстановительную способность." };
    case "strained":
      return { label: "Напряжённое восстановление", descriptor: "Восстановление становится менее предсказуемым под нагрузкой." };
    case "degraded":
      return { label: "Сниженное восстановление", descriptor: "Восстановительная способность заметно проседает при нагрузке." };
    case "critical":
      return { label: "Критически снижено", descriptor: "Восстановление нестабильно и не покрывает текущую нагрузку." };
  }
}

function bandToExcerpt(band: RecoveryScoreResult["band"]): { title: string; items: string[] } {
  switch (band) {
    case "stable":
      return {
        title: "Что это означает",
        items: [
          "Восстановление остаётся опорой при нагрузке.",
          "Компенсация не выглядит структурной.",
        ],
      };
    case "strained":
      return {
        title: "Что это означает",
        items: [
          "Восстановление требует больше времени, чем раньше.",
          "Риск компенсации растёт при сохранении нагрузки.",
          "Полезна повторная оценка при изменении режима.",
        ],
      };
    case "degraded":
      return {
        title: "Что это означает",
        items: [
          "Усталость накапливается быстрее восстановления.",
          "Компенсация может поддерживать результат без реального восстановления.",
          "Состояние становится менее предсказуемым.",
        ],
      };
    case "critical":
      return {
        title: "Что это означает",
        items: [
          "Восстановление не успевает за нагрузкой.",
          "Компенсация может маскировать деградацию.",
          "Полезен системный контур восстановления, а не точечные советы.",
        ],
      };
  }
}

export function toMobileRecoveryResult(score: RecoveryScoreResult): MobileResultScreen {
  const rs = bandToMobileLabel(score.band);
  const ex = bandToExcerpt(score.band);

  return {
    resultState: { label: rs.label, descriptor: rs.descriptor },
    context:
      "Это продуктовая ориентация по восстановительной способности при когнитивной нагрузке. Не является медицинской оценкой.",
    excerpt: {
      title: ex.title,
      items: (ex.items.slice(0, 3) as [string, string] | [string, string, string]),
    },
    referenceLink: { label: "What SoftFocus Gives", target: "/what-softfocus-gives" },
    closingNote: "Если экран вызывает давление или срочность — это сигнал несоответствия мобильной политике.",
  };
}

export function toDesktopRecoveryResult(score: RecoveryScoreResult): DesktopRecoveryResult {
  const rs = bandToMobileLabel(score.band);
  return {
    title: "Recovery Calculator",
    subtitle: rs.label,
    score: score.score,
    breakdown: {
      sleep: score.penalties.sleep,
      fatigue: score.penalties.fatigue,
      compensation: score.penalties.compensation,
      inertia: score.penalties.inertia,
    },
    interpretation: {
      heading: "Interpretation (non-medical)",
      bullets: bandToExcerpt(score.band).items,
    },
    disclaimer:
      "SoftFocus is non-medical. This output is an operational interpretation, not diagnosis or treatment.",
  };
}
