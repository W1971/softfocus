/**
 * CalculatorDocument
 *
 * Канонический тип документа калькулятора SoftFocus.
 * Используется ТОЛЬКО для описания контента и структуры.
 *
 * Не содержит логики.
 * Не содержит интерпретаций.
 * Не содержит клинических утверждений.
 */

export type CalculatorDocument = {
  title: string;
  description?: string;
  sections: Array<{
    id: string;
    title: string;
    content: string;
  }>;
};
