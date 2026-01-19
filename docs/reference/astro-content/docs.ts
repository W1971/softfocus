import fs from "fs";
import path from "path";

const DOCS_ROOT = path.resolve(process.cwd(), "docs/frontend");

export function loadFrontendDocs() {
  if (!fs.existsSync(DOCS_ROOT)) {
    throw new Error("docs/frontend not found");
  }

  return walk(DOCS_ROOT);
}

function walk(dir: string, acc: string[] = []): string[] {
  for (const entry of fs.readdirSync(dir)) {
    const p = path.join(dir, entry);
    const stat = fs.statSync(p);
    if (stat.isDirectory()) {
      walk(p, acc);
    } else if (p.endsWith(".md")) {
      acc.push(p);
    }
  }
  return acc;
}
