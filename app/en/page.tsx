import Link from "next/link";

export default function HomePageEN() {
  return (
    <main>
      <h1>SoftFocus — an analytical system for load and recovery</h1>

      <p>
        SoftFocus helps reveal whether recovery is closing
        under current cognitive load.
      </p>

      <p>
        The system provides no recommendations,
        no diagnoses, and defines no norms.
      </p>

      <section>
        <h2>Operational model of overload</h2>

        <p>
          SoftFocus describes overload, burnout, and recovery
          as operational processes, not as personal or clinical conditions.
        </p>

        <p>
          The model is built around a single question:
          is recovery closing under current load.
        </p>
      </section>

      <section>
        <h2>Analytical tools</h2>

        <p>
          SoftFocus tools show whether recovery closes
          under current load.
        </p>

        <Link href="/kalkulyator-sna">
          Sleep &amp; Recovery Calculator
        </Link>
      </section>

      <section>
        <Link href="/guides/explanations">
          Canonical SoftFocus Explanations
        </Link>
      </section>
    </main>
  );
}
