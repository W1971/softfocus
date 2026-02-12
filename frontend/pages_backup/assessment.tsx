import React, { useState } from "react";
import { useRouter } from "next/router";

import { loadQuestionSet } from "@/lib/loadQuestionSet";
import { runAssessment } from "@/lib/runAssessment";
import { emitAudit } from "@/lib/emitAudit";
import { useEntitlement } from "@/lib/useEntitlement";

import { QuestionCard } from "@/components/QuestionCard";
import { AnswerScale } from "@/components/AnswerScale";
import { LanguageSwitcher } from "@/components/LanguageSwitcher";

import RecoveryResultScreen from "@/screens/recovery/RecoveryResultScreen";
import { ResultContract } from "@/adapters/recovery/ResultContract";

export default function AssessmentPage() {
  const router = useRouter();

  // ---------------------------
  // locale + role (from URL)
  // ---------------------------
  const currentLocale =
    typeof router.locale === "string" ? router.locale : "ru-RU";

  const role =
    typeof router.query.role === "string"
      ? router.query.role
      : "generic";

  // ---------------------------
  // entitlement (depth only)
  // ---------------------------
  const entitled = useEntitlement();

  // ---------------------------
  // load questions
  // ---------------------------
  const qs = loadQuestionSet(role);
  const questions = Object.values(qs.sections).flat();

  // ---------------------------
  // state
  // ---------------------------
  const [index, setIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, number>>({});
  const [result, setResult] = useState<ResultContract | null>(null);
  const [loading, setLoading] = useState(false);

  // ---------------------------
  // RESULT VIEW
  // ---------------------------
  if (result) {
    return (
      <>
        <LanguageSwitcher />
        <RecoveryResultScreen
          result={result}
          onRestart={() => {
            setResult(null);
            setAnswers({});
            setIndex(0);
          }}
        />
      </>
    );
  }

  const q = questions[index];

  // ---------------------------
  // handle answer
  // ---------------------------
  async function handleAnswer(v: number) {
    const next = { ...answers, [q.id]: v };
    setAnswers(next);

    if (index + 1 < questions.length) {
      setIndex(index + 1);
      return;
    }

    // ---------------------------
    // FINAL STEP: evaluate
    // ---------------------------
    setLoading(true);

    const res = await runAssessment({
      answers: next,
      locale: currentLocale,
      role,
      entitlement: entitled
    });

    // ---------------------------
    // AUDIT (one-shot)
    // ---------------------------
    await emitAudit({
      type: "assessment_run",
      role,
      locale: currentLocale,
      entitled
    });

    setResult(res);
    setLoading(false);
  }

  // ---------------------------
  // ASSESSMENT VIEW
  // ---------------------------
  return (
    <div className="assessment">
      <LanguageSwitcher />

      {loading ? (
        <p>Обработка результата…</p>
      ) : (
        <>
          <QuestionCard
            text={q.text}
            index={index}
            total={questions.length}
          />
          <AnswerScale
            value={answers[q.id] ?? null}
            onChange={handleAnswer}
          />
        </>
      )}
    </div>
  );
}
