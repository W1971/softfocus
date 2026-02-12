import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

const SUPPORTED = ["en", "ru", "es", "ar"];

export function proxy(request: NextRequest) {
  const { pathname } = request.nextUrl;

  const segments = pathname.split("/");
  const lang = segments[1];

  // если язык не указан — редирект на /en
  if (!SUPPORTED.includes(lang)) {
    const url = request.nextUrl.clone();
    url.pathname = `/en${pathname === "/" ? "" : pathname}`;
    return NextResponse.redirect(url);
  }

  const response = NextResponse.next();

  response.headers.set("x-lang", lang);
  response.headers.set("x-dir", lang === "ar" ? "rtl" : "ltr");

  return response;
}

export const config = {
  matcher: ["/((?!_next|api|favicon.ico).*)"],
};
