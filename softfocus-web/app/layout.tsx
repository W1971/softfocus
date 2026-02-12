import "./globals.css";
import { headers } from "next/headers";

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {

  const headersList = await headers();
  const lang = headersList.get("x-lang") || "en";
  const dir = headersList.get("x-dir") || "ltr";

  return (
    <html lang={lang} dir={dir}>
      <body>{children}</body>
    </html>
  );
}
