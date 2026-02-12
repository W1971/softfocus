export default {
  id: "recovery.product.v1",
  role: "product-manager",
  locale: "ru-RU",
  period_days: 14,
  scale: {
    min: 0,
    max: 3,
    labels: [
      "Сигнал отсутствует",
      "Эпизодически",
      "Регулярно",
      "Устойчиво"
    ]
  },
  sections: {
    latency: [
      { id: "pm_lat_01", text: "Решения по продукту требуют больше времени для включения." }
    ],
    residual: [
      { id: "pm_res_01", text: "Мышление о приоритетах продолжается вне рабочего времени." }
    ],
    compensation: [
      { id: "pm_comp_01", text: "Работоспособность поддерживается за счёт давления на себя." }
    ],
    predictability: [
      { id: "pm_pred_01", text: "Эффект отдыха на ясность решений нестабилен." }
    ],
    detachment: [
      { id: "pm_det_01", text: "Возникает дистанция к продуктовым решениям." }
    ]
  }
};
