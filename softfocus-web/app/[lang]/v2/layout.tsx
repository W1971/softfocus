import { AssessmentProvider } from "./state/AssessmentContext";

export default function V2Layout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <AssessmentProvider>{children}</AssessmentProvider>;
}
