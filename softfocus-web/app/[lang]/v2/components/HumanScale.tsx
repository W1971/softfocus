"use client";

import { useState, useEffect } from "react";

type Props = {
  onSelect: (value: number) => void;
};

const options = [
  { label: "Absent", value: 0 },
  { label: "Episodic", value: 1 },
  { label: "Regular", value: 2 },
  { label: "Structural", value: 3 },
];

export default function HumanScale({ onSelect }: Props) {
  const [selected, setSelected] = useState<number | null>(null);

  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") {
        setSelected((prev) =>
          prev === null ? 0 : Math.min(prev + 1, options.length - 1)
        );
      }
      if (e.key === "ArrowLeft") {
        setSelected((prev) =>
          prev === null ? 0 : Math.max(prev - 1, 0)
        );
      }
      if (e.key === "Enter" && selected !== null) {
        onSelect(selected);
      }
    };

    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [selected, onSelect]);

  const handleClick = (value: number) => {
    setSelected(value);
    setTimeout(() => {
      onSelect(value);
    }, 140);
  };

  return (
    <div
      style={{
        display: "flex",
        gap: 4,
        marginTop: 32,
        background: "#f5f5f5",
        padding: 4,
        borderRadius: 10,
        width: "fit-content",
      }}
    >
      {options.map((option) => {
        const active = selected === option.value;

        return (
          <button
            key={option.value}
            onClick={() => handleClick(option.value)}
            style={{
              padding: "10px 14px",
              borderRadius: 8,
              border: "none",
              fontSize: 14,
              background: active ? "#ffffff" : "transparent",
              color: active ? "#111" : "#666",
              boxShadow: active
                ? "0 1px 2px rgba(0,0,0,0.08)"
                : "none",
              transition:
                "all 160ms cubic-bezier(.2,.8,.2,1)",
              cursor: "pointer",
            }}
          >
            {option.label}
          </button>
        );
      })}
    </div>
  );
}
