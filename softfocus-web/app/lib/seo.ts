export const SUPPORTED_LANGS = ["en", "ru", "es", "ar"] as const;
export const DEFAULT_LANG = "en";

export const SITE_URL =
  process.env.NEXT_PUBLIC_SITE_URL || "https://softfocus.ai";

export function buildAlternates(path: string) {
  const cleanPath = path.startsWith("/") ? path : `/${path}`;

  const languages = Object.fromEntries(
    SUPPORTED_LANGS.map((lang) => [
      lang,
      `${SITE_URL}/${lang}${cleanPath === "/" ? "" : cleanPath}`,
    ])
  );

  return {
    canonical: languages[DEFAULT_LANG],
    languages: {
      ...languages,
      "x-default": languages[DEFAULT_LANG],
    },
  };
}

