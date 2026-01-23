import { useEffect } from "react";
import { SoftFocusMobileResult } from "@/types/mobile/SoftFocusMobileResult";
import { track } from "@/utils/track";

type Props = {
  data: SoftFocusMobileResult;
};

export function MobileResultScreen({ data }: Props) {
  // Impression
  useEffect(() => {
    track("excerpt_impression", {
      component: "mobile_result_screen"
    });

    const timer = setTimeout(() => {
      track("excerpt_read", {
        component: "mobile_result_screen"
      });
    }, 8000);

    return () => clearTimeout(timer);
  }, []);

  return (
    <main role="main">
      <section>
        <h1>{data.resultState.label}</h1>
        <p>{data.resultState.descriptor}</p>
      </section>

      <section>
        <p>{data.context}</p>
      </section>

      <section>
        <h2>{data.excerpt.title}</h2>
        <ul>
          {data.excerpt.items.map((item, i) => (
            <li key={i}>{item}</li>
          ))}
        </ul>
      </section>

      <section>
        <a
          href={data.referenceLink.target}
          onClick={() =>
            track("excerpt_click", {
              target: "what_softfocus_gives"
            })
          }
        >
          {data.referenceLink.label}
        </a>
      </section>

      {data.closingNote && (
        <section>
          <p>{data.closingNote}</p>
        </section>
      )}
    </main>
  );
}
