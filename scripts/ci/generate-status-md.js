#!/usr/bin/env node

import fs from "fs";
import { execSync } from "child_process";
import path from "path";

const ROOT = process.cwd();
const RULES_PATH = path.join(ROOT, "alias_softfocus/status/rules.json");

const rules = fs.existsSync(RULES_PATH)
  ? JSON.parse(fs.readFileSync(RULES_PATH, "utf8"))
  : {};

const ALIASES = [
  "project-clean",
  "content-validate",
  "pipeline-check",
  "backend-check",
  "frontend-build",
  "generate-status",
  "docs",
  "frontend-test",
  "project-check",
  "ci-gate",
  "export-report",
  "backend-clean"
];

function runCommand(cmd) {
  try {
    execSync(cmd, { stdio: "ignore" });
    return true;
  } catch {
    return false;
  }
}

function deriveStatus(alias) {
  const rule = rules[alias];
  if (!rule || !rule.ready_if) {
    return "LOW_CONFIDENCE";
  }

  for (const cmd of rule.ready_if) {
    const ok = runCommand(`npm run ${cmd}`);
    if (!ok) return "FAIL";
  }

  return "READY";
}

const groups = {
  CORE: [],
  OPTIONAL: [],
  EXPERIMENTAL: []
};

for (const alias of ALIASES) {
  const status = deriveStatus(alias);

  if (["project-clean", "content-validate", "pipeline-check", "backend-check", "frontend-build", "generate-status", "docs"].includes(alias)) {
    groups.CORE.push({ alias, status });
  } else if (["frontend-test", "project-check", "ci-gate", "export-report"].includes(alias)) {
    groups.OPTIONAL.push({ alias, status });
  } else {
    groups.EXPERIMENTAL.push({ alias, status });
  }
}

let out = `# Project Status — SoftFocus\n\n`;

for (const section of ["CORE", "OPTIONAL", "EXPERIMENTAL"]) {
  out += `## ${section}\n`;
  for (const item of groups[section]) {
    out += `- ${item.alias}: ${item.status}\n`;
  }
  out += `\n`;
}

fs.writeFileSync("STATUS.md", out);
console.log("✔ STATUS.md generated");
