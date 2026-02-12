"use client";

import { createContext, useContext, useState, ReactNode } from "react";
import { questions } from "../questions";

type AssessmentContextType = {
  step: number;
  answers: (number | null)[];
  next: (value: number) => void;
  prev: () => void;
};

const AssessmentContext = createContext<AssessmentContextType | null>(null);

export function AssessmentProvider({ children }: { children: ReactNode }) {
  const [step, setStep] = useState(0);
  const [answers, setAnswers] = useState<(number | null)[]>(
    Array(questions.length).fill(null)
  );

  const next = (value: number) => {
    const updated = [...answers];
    updated[step] = value;
    setAnswers(updated);

    if (step < questions.length - 1) {
      setStep(step + 1);
    } else {
      window.location.href = "/v2/result";
    }
  };

  const prev = () => {
    if (step > 0) setStep(step - 1);
  };

  return (
    <AssessmentContext.Provider value={{ step, answers, next, prev }}>
      {children}
    </AssessmentContext.Provider>
  );
}

export function useAssessment() {
  const ctx = useContext(AssessmentContext);
  if (!ctx) throw new Error("AssessmentContext missing");
  return ctx;
}
