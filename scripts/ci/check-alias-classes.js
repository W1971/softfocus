#!/usr/bin/env node
import fs from "fs";
import path from "path";

const ROOT = process.cwd();
const STATUS_DIR = path.join(ROOT, "alias_softfocus/status");
const CLASSES_FILE = path.join(ROOT, "alias_softfocus/alias-classes.yaml");

function parseCoreAliases() {
  const text = fs.readFileSync(CLASSES_FILE, "utf8");
  const lines = text.split("\n");

  const core = [];
  let inCore = false;

  for (const l of lines) {
    if (l.trim() === "CORE:") {
      inCore = true;
      continue;
    }
    if (/^\S+:/.test(l)) inCore = false;

    if (inCore) {
      const m = l.match(/^\s*-\s*(\S+)/);
      if (m) core.push(m[1]);
    }
  }
  return core;
}

function readStatus(name) {
  const f = path.join(STATUS_DIR, `${name}.status`);
  if (!fs.existsSync(f)) return "UNKNOWN";
  const m = fs.readFileSync(f, "utf8").match(/derived_state\s+(\w+)/);
  return m ? m[1] : "UNKNOWN";
}

let failed = false;
const coreAliases = parseCoreAliases();

for (const a of coreAliases) {
  const s = readStatus(a);
  if (s !== "READY") {
    console.error(`❌ CORE alias '${a}' status=${s}`);
    failed = true;
  }
}

if (failed) {
  console.error("CI BLOCKED: CORE alias not READY");
  process.exit(1);
}

console.log("✔ CI alias class check passed");
