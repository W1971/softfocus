import type { Metadata } from "next";
import Header from "../components/Header";
import { buildAlternates } from "../lib/seo";

type Props = {
  children: React.ReactNode;
  params: Promise<{ lang: string }>;
};

export async function generateMetadata(
  { params }: Props
): Promise<Metadata> {

  const { lang } = await params;

  const alternates = buildAlternates("/");

  return {
    metadataBase: new URL(
      process.env.NEXT_PUBLIC_SITE_URL || "https://softfocus.ai"
    ),
    title: "SoftFocus",
    description:
      "Structural assessment of recovery under sustained cognitive load.",
    alternates: {
      canonical:
        alternates.languages[
          lang as keyof typeof alternates.languages
        ],
      languages: alternates.languages,
    },
  };
}

export default async function LangLayout({
  children,
  params,
}: Props) {

  const { lang } = await params;

  return (
    <>
      <Header lang={lang} />
      <main
        className={`sf-editorial ${lang === "ar" ? "sf-rtl" : ""}`}
      >
        {children}
      </main>
    </>
  );
}
