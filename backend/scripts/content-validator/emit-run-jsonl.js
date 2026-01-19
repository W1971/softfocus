#!/usr/bin/env node

import fs from "fs";
import path from "path";

const {
  RUN_ID,
  SCENARIO_ID,
  TARGET,
  CONTENT_TYPE,
  RULE,
  RESULT,
  SEVERITY,
  DETAILS
} = process.env;

if (!RUN_ID || !TARGET || !RULE || !SEVERITY) {
  console.error("emit-run-jsonl: missing required env");
  process.exit(1);
}

const runDir = path.join(process.cwd(), "tests", "runs", RUN_ID);
fs.mkdirSync(runDir, { recursive: true });

const record = {
  run_id: RUN_ID,
  scenario_id: SCENARIO_ID || "TS-CONTENT-VALIDATE-001",
  alias: "content-validate",
  script: "validate-content.cjs",
  target: TARGET,
  content_type: CONTENT_TYPE || "unknown",
  rule: RULE,
  result: RESULT || "missing",
  details: DETAILS ? JSON.parse(DETAILS) : {},
  severity: SEVERITY,
  human_override: false
};

fs.appendFileSync(
  path.join(runDir, "run.jsonl"),
  JSON.stringify(record) + "\n"
);

console.log("✔ emitted run.jsonl entry");
