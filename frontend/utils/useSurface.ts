import { useEffect, useState } from "react";

export type Surface = "mobile" | "desktop";

/**
 * Surface detection is passive.
 * No resizing pressure, no adaptation loops.
 */
export function useSurface(): Surface {
  const [surface, setSurface] = useState<Surface>("desktop");

  useEffect(() => {
    const update = () => {
      setSurface(window.innerWidth <= 768 ? "mobile" : "desktop");
    };
    update();
    window.addEventListener("resize", update);
    return () => window.removeEventListener("resize", update);
  }, []);

  return surface;
}
