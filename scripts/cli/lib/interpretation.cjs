function stateHeadlineRu(state) {
  if (state === 'recovery_closes') return 'Восстановление закрывается при текущей нагрузке';
  if (state === 'recovery_does_not_close') return 'Восстановление не закрывается при текущей нагрузке';
  return 'Восстановление нестабильно при текущей нагрузке';
}

function driverLabelRu(k) {
  switch (k) {
    case 'latency': return 'Латентность восстановления';
    case 'residual': return 'Остаточная усталость';
    case 'compensation': return 'Компенсация';
    case 'predictability': return 'Предсказуемость восстановления';
    case 'detachment': return 'Эмоциональная дистанция';
    default: return k;
  }
}

function buildBodyRu({ summary, profile, entitled }) {
  const lines = [];

  // 1) descriptive state line
  if (summary.state === 'recovery_does_not_close') {
    lines.push('Сигналы указывают на устойчивый дефицит восстановления при текущей нагрузке.');
  } else if (summary.state === 'recovery_unstable') {
    lines.push('Восстановление даёт переменный эффект и не формирует устойчивого ресурса.');
  } else {
    lines.push('Восстановление в целом закрывается и остаётся операционно устойчивым.');
  }

  // 2) profile reflection (no advice)
  lines.push(`Доминирующий источник нагрузки: ${driverLabelRu(profile.dominant_load)}.`);
  lines.push(`Удерживающий механизм: ${driverLabelRu(profile.dominant_mechanism)}.`);

  // 3) Entitlement expands depth (still no advice)
  if (entitled) {
    const drv = (profile.drivers || []).slice(0, 3)
      .map(d => `${driverLabelRu(d.key)}: ${d.level === 'high' ? 'высокая' : d.level === 'medium' ? 'средняя' : 'низкая'}`)
      .join('; ');
    lines.push(`Карта драйверов: ${drv}.`);
  }

  return lines.slice(0, entitled ? 5 : 4);
}

function buildInterpretation({ locale, summary, profile, entitled }) {
  // Phase D: RU primary; other locales can be added later without semantic drift.
  if (String(locale).toLowerCase().startsWith('ru')) {
    return {
      headline: stateHeadlineRu(summary.state),
      body: buildBodyRu({ summary, profile, entitled: Boolean(entitled) })
    };
  }

  // Safe fallback (minimal):
  return {
    headline: 'Recovery state (non-clinical)',
    body: ['This output is descriptive only.']
  };
}

module.exports = { buildInterpretation };
