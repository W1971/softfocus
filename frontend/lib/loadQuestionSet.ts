import generic from "@/content/calculators/recoveryQuestions.questionSet";
import product from "@/content/calculators/recoveryQuestions.product.questionSet";

export function loadQuestionSet(role: string) {
  switch (role) {
    // explicit product variant
    case "product":
    case "product-managers":
      return product;

    // all other roles → generic (Phase D compliant)
    case "risk":
    case "risk-analysts":
    case "executives":
    case "compliance":
    case "compliance-managers":
    case "managers":
    case "finance":
    case "finance-analysts":
      return generic;

    default:
      return generic;
  }
}
