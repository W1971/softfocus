import { MobileResultScreen as ScreenModel } from "../../types/mobile/MobileResultScreen";

type Props = {
  screen: ScreenModel;
};

export function MobileResultScreen({ screen }: Props) {
  return (
    <main style={{ padding: 16 }}>
      {/* 1. Result State */}
      <section>
        <h1>{screen.resultState.label}</h1>
        <p>{screen.resultState.descriptor}</p>
      </section>

      {/* 2. Context */}
      <section>
        <p>{screen.context}</p>
      </section>

      {/* 3. Excerpt */}
      <section>
        <h2>{screen.excerpt.title}</h2>
        <ul>
          {screen.excerpt.items.map((item, i) => (
            <li key={i}>{item}</li>
          ))}
        </ul>
      </section>

      {/* 4. Reference (non-CTA) */}
      <section>
        <a href={screen.referenceLink.target}>
          {screen.referenceLink.label}
        </a>
      </section>

      {/* 5. Neutral Close (optional) */}
      {screen.closingNote && (
        <section>
          <p>{screen.closingNote}</p>
        </section>
      )}
    </main>
  );
}
