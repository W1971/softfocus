import { B2BDocument } from "../../types/b2b/B2BDocument";

type Props = {
  document: B2BDocument;
};

export function B2BDocumentScreen({ document }: Props) {
  return (
    <main style={{ padding: 24, maxWidth: 720 }}>
      <h1>{document.title}</h1>
      <p><strong>Audience:</strong> {document.audience}</p>

      {document.sections.map((section, i) => (
        <section key={i}>
          <h2>{section.heading}</h2>
          {section.body.map((line, j) => (
            <p key={j}>{line}</p>
          ))}
        </section>
      ))}

      <hr />
      <small>{document.complianceBoundary}</small>
    </main>
  );
}
