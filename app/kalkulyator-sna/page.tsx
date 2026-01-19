import SleepCalculator from "./components/SleepCalculator";

export const metadata = {
  title: "Калькулятор сна — SoftFocus",
  description: "Оценка восстановления и дефицита сна без медицинских диагнозов"
};

export default function Page() {
  return (
    <main style={{ maxWidth: 720, margin: "0 auto", padding: "24px" }}>
      <h1>Калькулятор сна</h1>
      <p>
        Инструмент ориентации по режиму сна за последние 7 дней.
        Без норм, без диагнозов, без медицинской лексики.
      </p>

      <SleepCalculator />
    </main>
  );
}
