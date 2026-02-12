"use client";

type Props = {
  current: number;
  total: number;
};

export default function Progress({ current, total }: Props) {
  const percent = ((current + 1) / total) * 100;

  return (
    <div className="progress-wrap">
      <div
        className="progress-bar"
        style={{ width: `${percent}%` }}
      />
    </div>
  );
}
