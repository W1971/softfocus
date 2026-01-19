import Head from "next/head";

export default function CalculatorsHub() {
  return (
    <>
      <Head>
        <title>Калькуляторы сна и восстановления — SoftFocus</title>
        <meta
          name="description"
          content="Калькуляторы сна и восстановления для оценки качества отдыха и устойчивости нагрузки."
        />
      </Head>

      <main>
        <h1>Калькуляторы восстановления</h1>

        <p>
          Калькуляторы помогают оценить не самочувствие,
          а эффективность восстановления при текущей нагрузке.
        </p>

        <ul>
          <li>
            <a href="/kalkulyator-sna">
              Калькулятор сна и восстановления
            </a>
          </li>
        </ul>
      </main>
    </>
  );
}
