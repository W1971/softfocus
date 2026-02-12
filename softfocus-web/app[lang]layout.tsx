import type { Metadata } from "next";
import Header from "../components/Header";
import { buildAlternates, SITE_URL } from "../lib/seo";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ lang: string }>;
}): Promise<Metadata> {

  const { lang } = await params;
  const alternates = buildAlternates("");

  const title = "SoftFocus — Structural Cognitive Assessment";
  const description =
    "A structural orientation system for understanding cognitive strain under sustained responsibility.";

  return {
    metadataBase: new URL(SITE_URL),
    title,
    description,
    alternates,

    openGraph: {
      type: "website",
      url: `/${lang}`,
      title,
      description,
      siteName: "SoftFocus",
      images: [
        {
          url: "/og-image.png",
          width: 1200,
          height: 630,
          alt: "SoftFocus",
        },
      ],
    },

    twitter: {
      card: "summary_large_image",
      title,
      description,
      images: ["/og-image.png"],
    },
  };
}

export default async function LangLayout({
  children,
  params,
}: {
  children: React.ReactNode;
  params: Promise<{ lang: string }>;
}) {

  const { lang } = await params;
  const isRTL = lang === "ar";

  const structuredData = {
    "@context": "https://schema.org",
    "@type": "WebApplication",
    name: "SoftFocus",
    applicationCategory: "BusinessApplication",
    operatingSystem: "Web",
    url: SITE_URL,
    description:
      "Structural assessment of cognitive strain under sustained responsibility.",
    inLanguage: lang,
    publisher: {
      "@type": "Organization",
      name: "SoftFocus",
      url: SITE_URL,
    },
  };

  return (
    <html lang={lang} dir={isRTL ? "rtl" : "ltr"}>
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(structuredData),
          }}
        />
      </head>
      <body>
        <Header lang={lang} />
        <main className="sf-editorial">{children}</main>
      </body>
    </html>
  );
}
