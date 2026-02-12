import React from "react";
import { useRouter } from "next/router";

const locales = ["ru", "en", "es", "ar"];

export function LanguageSwitcher() {
  const router = useRouter();
  const { pathname, query } = router;

  function switchTo(locale: string) {
    router.push({ pathname, query }, undefined, { locale });
  }

  return (
    <div className="lang-switch">
      {locales.map(l => (
        <button key={l} onClick={() => switchTo(l)}>
          {l.toUpperCase()}
        </button>
      ))}
    </div>
  );
}
