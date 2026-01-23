#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const TARGET_DIR = path.join(ROOT, "frontend");

const FORBIDDEN_PATTERNS = [
  { regex: /\b\d+%|\b\d+\b/, reason: "Numeric value detected" },
  { regex: /chart|graph|progress/i, reason: "Chart / progress UI" },
  { regex: /Next step|Do now|Fix|Improve/i, reason: "CTA language" },
  { regex: /Dashboard|Panel|Sidebar/i, reason: "Desktop layout term" },
  { regex: /Tabs?|Accordion|Collapse/i, reason: "Complex interaction pattern" }
];

function walk(dir, files = []) {
  fs.readdirSync(dir).forEach(entry => {
    const fullPath = path.join(dir, entry);
    if (fs.statSync(fullPath).isDirectory()) {
      walk(fullPath, files);
    } else if (fullPath.endsWith(".tsx") || fullPath.endsWith(".jsx")) {
      files.push(fullPath);
    }
  });
  return files;
}

let violations = 0;
const files = walk(TARGET_DIR);

for (const file of files) {
  const content = fs.readFileSync(file, "utf8");

  // Only audit mobile components
  if (!file.includes("/mobile/")) continue;

  FORBIDDEN_PATTERNS.forEach(({ regex, reason }) => {
    if (regex.test(content)) {
      console.error(
        `[MOBILE-UI-AUDIT][FAIL] ${file} → ${reason}`
      );
      violations++;
    }
  });
}

if (violations > 0) {
  console.error(`[MOBILE-UI-AUDIT] BLOCK (${violations} violations)`);
  process.exit(1);
}

console.log("[MOBILE-UI-AUDIT] PASS");
process.exit(0);
