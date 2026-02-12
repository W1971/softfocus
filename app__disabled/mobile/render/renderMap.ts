/**
 * Render Map — Phase D
 * Maps semantic keys to RN components.
 * NO text here. NO logic here.
 */

import OrientationScreen from '../screens/OrientationScreen';
import AssessmentScreen from '../screens/AssessmentScreen';
import ResultScreen from '../screens/ResultScreen';

export const renderMap = {
  orientation: OrientationScreen,
  assessment: AssessmentScreen,
  result: ResultScreen
} as const;

export type RenderKey = keyof typeof renderMap;
