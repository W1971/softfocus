"use client";

import { useEffect } from "react";

type Props = {
  value: number | null;
  onSelect: (v: number) => void;
};

export default function Segmented({ value, onSelect }: Props) {
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "1") onSelect(0);
      if (e.key === "2") onSelect(1);
      if (e.key === "3") onSelect(2);
      if (e.key === "4") onSelect(3);
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [onSelect]);

  return (
    <div className="scale">
      {[0, 1, 2, 3].map((v) => (
        <button
          key={v}
          className={`dot ${value === v ? "active" : ""}`}
          onClick={() => onSelect(v)}
        />
      ))}
    </div>
  );
}
