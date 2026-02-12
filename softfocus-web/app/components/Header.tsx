"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { usePathname } from "next/navigation";

type Props = {
  lang: string;
};

const LANGS = ["en", "ru", "es", "ar"] as const;

function stripLang(pathname: string) {
  const parts = pathname.split("/").filter(Boolean);
  if (parts.length === 0) return "/";
  if (LANGS.includes(parts[0] as any)) {
    const rest = parts.slice(1).join("/");
    return rest ? `/${rest}` : "/";
  }
  return pathname.startsWith("/") ? pathname : `/${pathname}`;
}

function withLang(lang: string, pathname: string) {
  const base = stripLang(pathname);
  return `/${lang}${base === "/" ? "" : base}`;
}

export default function Header({ lang }: Props) {
  const pathname = usePathname();
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 12);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const base = useMemo(() => stripLang(pathname || "/"), [pathname]);

  const nav = useMemo(() => {
    const items = [
      { label: "System", href: `/${lang}` },
      { label: "Assessment", href: `/${lang}/v2/flow` },
    ];
    return items;
  }, [lang]);

  return (
    <header className={`sf-header ${scrolled ? "scrolled" : ""}`}>
      <div className="sf-header-inner">
        <div className="sf-left">
          <Link className="sf-logo" href={`/${lang}`}>
            SoftFocus
          </Link>

          <nav className="sf-nav" aria-label="Primary">
            {nav.map((item) => {
              const isActive =
                (base === "/" && item.href === `/${lang}`) ||
                (base !== "/" && item.href.endsWith(base));

              return (
                <Link
                  key={item.href}
                  href={item.href}
                  className={isActive ? "active" : undefined}
                >
                  {item.label}
                </Link>
              );
            })}
          </nav>
        </div>

        <div className="sf-lang-switch" aria-label="Language">
          {LANGS.map((l) => {
            const href = withLang(l, pathname || "/");
            const active = l === lang;
            return (
              <Link
                key={l}
                href={href}
                className={active ? "active-lang" : undefined}
              >
                {l.toUpperCase()}
              </Link>
            );
          })}
        </div>
      </div>
    </header>
  );
}
