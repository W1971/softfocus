import { MobileResultScreen } from "../mobile/MobileResultScreen";

export type DesktopRecoveryResult = {
  title: string;
  subtitle: string;
  score: number; // allowed on desktop
  breakdown: {
    sleep: number;
    fatigue: number;
    compensation: number;
    inertia: number;
  };
  interpretation: {
    heading: string;
    bullets: string[];
  };
  disclaimer: string;
};

export type MobileRecoveryResult = MobileResultScreen;
