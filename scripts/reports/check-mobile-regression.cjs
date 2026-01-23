#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const DIR = "reports/mobile";

if (!fs.existsSync(DIR)) {
  process.exit(0);
}

const files = fs.readdirSync(DIR)
  .filter(f => f.startsWith("mobile-resonance-"))
  .sort()
  .slice(-7);

if (files.length < 4) {
  process.exit(0);
}

const reports = files.map(f =>
  JSON.parse(fs.readFileSync(path.join(DIR, f), "utf8"))
);

const last3 = reports.slice(-3);
const last7 = reports;

const avg = arr =>
  arr.reduce((a, b) => a + b, 0) / arr.length;

const avgClickRate7 =
  avg(last7.map(r =>
    r.ratios.click_rate === "n/a" ? 0 : Number(r.ratios.click_rate)
  ));

const regressionRead =
  last3.every(r =>
    r.ratios.read_rate !== "n/a" &&
    Number(r.ratios.read_rate) < 0.10
  );

const regressionClick =
  last3.every(r =>
    r.ratios.click_rate !== "n/a" &&
    Number(r.ratios.click_rate) < avgClickRate7 * 0.6
  );

if (regressionRead || regressionClick) {
  console.error("[ALERT] Mobile resonance regression detected");
  console.error({
    regressionRead,
    regressionClick,
    avgClickRate7
  });
  process.exit(1);
}

console.log("[ALERT] Mobile resonance stable");
