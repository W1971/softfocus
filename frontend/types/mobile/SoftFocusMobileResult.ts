/**
 * SoftFocus Mobile Result — Phase B
 * Canonical, non-clinical result schema
 */

export interface SoftFocusStage {
  label: string;
  descriptor: string;
}

export interface SoftFocusContext {
  summary: string;
}

export interface SoftFocusExcerpt {
  title: string;

  /**
   * Ordered list of key points.
   * UI may display up to 3 items.
   */
  points: string[];
}

export interface SoftFocusMobileResult {
  /**
   * High-level recovery / burnout stage.
   * Non-clinical, label-only.
   */
  stage: SoftFocusStage;

  /**
   * Contextual explanation block.
   */
  context: SoftFocusContext;

  /**
   * Short excerpt for UI rendering.
   */
  excerpt: SoftFocusExcerpt;

  /**
   * Optional numeric score.
   */
  score?: number;

  /**
   * Optional metadata.
   */
  meta?: Record<string, unknown>;
}
