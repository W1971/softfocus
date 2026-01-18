#!/usr/bin/env node
import fs from "fs";
import path from "path";

const ROOT = process.cwd();
const RUNS_DIR = path.join(ROOT, "tests/runs");
const STATUS_DIR = path.join(ROOT, "alias_softfocus/status");
const CLASSES_FILE = path.join(ROOT, "alias_softfocus/alias-classes.yaml");

fs.mkdirSync(STATUS_DIR, { recursive: true });

function parseAliasClasses() {
  const text = fs.readFileSync(CLASSES_FILE, "utf8");
  const lines = text.split("\n");

  const aliases = [];
  for (const l of lines) {
    const m = l.match(/^\s*-\s*(\S+)/);
    if (m) aliases.push(m[1]);
  }
  return aliases;
}

function deriveStatus() {
  if (!fs.existsSync(RUNS_DIR)) return "LOW_CONFIDENCE";

  const runs = fs.readdirSync(RUNS_DIR);
  if (!runs.length) return "LOW_CONFIDENCE";

  for (const r of runs) {
    const f = path.join(RUNS_DIR, r, "run.jsonl");
    if (!fs.existsSync(f)) continue;
    if (fs.readFileSync(f, "utf8").includes('"status":"fail"')) {
      return "FAIL";
    }
  }
  return "READY";
}

const state = deriveStatus();
const aliases = parseAliasClasses();

for (const a of aliases) {
  fs.writeFileSync(
    path.join(STATUS_DIR, `${a}.status`),
    `derived_state ${state}\n`
  );
}

console.log("✔ Alias statuses generated:", state);
