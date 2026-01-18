#!/usr/bin/env node
import fs from "fs";
import path from "path";

const ROOT = process.cwd();
const STATUS_DIR = path.join(ROOT, "alias_softfocus/status");
const CLASSES_FILE = path.join(ROOT, "alias_softfocus/alias-classes.yaml");

function parseClasses() {
  const text = fs.readFileSync(CLASSES_FILE, "utf8");
  const lines = text.split("\n");

  const classes = { CORE: [], OPTIONAL: [], EXPERIMENTAL: [] };
  let current = null;

  for (const l of lines) {
    const header = l.match(/^(\w+):\s*$/);
    if (header) {
      current = header[1];
      continue;
    }

    const item = l.match(/^\s*-\s*(\S+)/);
    if (item && current && classes[current]) {
      classes[current].push(item[1]);
    }
  }

  return classes;
}

function readStatus(name) {
  const f = path.join(STATUS_DIR, `${name}.status`);
  if (!fs.existsSync(f)) return "UNKNOWN";
  const m = fs.readFileSync(f, "utf8").match(/derived_state\s+(\w+)/);
  return m ? m[1] : "UNKNOWN";
}

const classes = parseClasses();

let out = [];
out.push("# Project Status — SoftFocus\n");

for (const section of ["CORE", "OPTIONAL", "EXPERIMENTAL"]) {
  out.push(`## ${section}`);
  for (const a of classes[section]) {
    out.push(`- ${a}: ${readStatus(a)}`);
  }
  out.push("");
}

fs.writeFileSync(path.join(ROOT, "STATUS.md"), out.join("\n"));
console.log("✔ STATUS.md generated");
