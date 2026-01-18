#!/usr/bin/env node
import { loadFrontendDocs } from "../../src/content/docs.js";

try {
  const docs = loadFrontendDocs();
  if (docs.length === 0) {
    throw new Error("No frontend docs found");
  }
  console.log(`✔ Frontend docs loaded: ${docs.length} files`);
} catch (e) {
  console.error("❌ Frontend docs check failed");
  console.error(e.message);
  process.exit(1);
}
