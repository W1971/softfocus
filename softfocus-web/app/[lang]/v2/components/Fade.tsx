"use client";

import { useEffect, useState } from "react";

export default function Fade({ children }: { children: React.ReactNode }) {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    setTimeout(() => setVisible(true), 50);
  }, []);

  return (
    <div
      style={{
        opacity: visible ? 1 : 0,
        transition: "opacity 400ms ease",
      }}
    >
      {children}
    </div>
  );
}
