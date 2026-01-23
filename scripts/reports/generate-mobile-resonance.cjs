#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const LOG_FILE = "backend/logs/ui-events.jsonl";
const OUT_DIR = "reports/mobile";

if (!fs.existsSync(LOG_FILE)) {
  console.error("No event log found");
  process.exit(0);
}

const lines = fs.readFileSync(LOG_FILE, "utf8")
  .trim()
  .split("\n")
  .map(JSON.parse);

const today = new Date().toISOString().slice(0, 10);

const todayEvents = lines.filter(e =>
  new Date(e.ts).toISOString().startsWith(today)
);

const counts = {
  impression: 0,
  click: 0,
  read: 0
};

todayEvents.forEach(e => {
  if (e.event === "excerpt_impression") counts.impression++;
  if (e.event === "excerpt_click") counts.click++;
  if (e.event === "excerpt_read") counts.read++;
});

const report = {
  date: today,
  mobile_resonance: {
    impression: counts.impression,
    click: counts.click,
    read: counts.read
  },
  ratios: {
    click_rate: counts.impression
      ? (counts.click / counts.impression).toFixed(2)
      : "n/a",
    read_rate: counts.impression
      ? (counts.read / counts.impression).toFixed(2)
      : "n/a"
  },
  interpretation: "Resonance reflects orientation value, not engagement."
};

const outFile = path.join(
  OUT_DIR,
  `mobile-resonance-${today}.json`
);

fs.writeFileSync(outFile, JSON.stringify(report, null, 2));

console.log(`[REPORT] Mobile resonance generated: ${outFile}`);
