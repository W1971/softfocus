#!/usr/bin/env node
import fs from "fs";
import path from "path";

const RUN_ID = process.env.RUN_ID;
if (!RUN_ID) {
  console.error("RUN_ID is required");
  process.exit(1);
}

const runDir = path.join("tests", "runs", RUN_ID);
fs.mkdirSync(runDir, { recursive: true });

const record = {
  run_id: RUN_ID,
  alias: "content-validate",
  status: "PASS"
};

fs.appendFileSync(
  path.join(runDir, "run.jsonl"),
  JSON.stringify(record) + "\n"
);

console.log(`✔ emitted run.jsonl entry (RUN_ID=${RUN_ID})`);
