#!/usr/bin/env node

import fs from "fs";
import path from "path";

const REQUIRED_FRONTMATTER = ["type", "locale", "path"];

const URGENCY_PATTERNS = [
  /\b(act now|don't wait|limited time|only today|last chance|hurry)\b/i
];

const JOURNEY_PATTERNS = [
  /\b(journey|your path|unlock|level up|you deserve)\b/i
];

const CANONICAL_TERMS = [
  "burnout",
  "cognitive load",
  "mental fatigue",
  "emotional detachment",
  "recovery capacity",
  "structured intervention"
];

function getAllFiles(dir, exts = [".md", ".mdx", ".txt"]) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      out.push(...getAllFiles(full, exts));
    } else if (exts.includes(path.extname(entry.name))) {
      out.push(full);
    }
  }
  return out;
}

function parseFrontmatter(content) {
  if (!content.startsWith("---")) return { fm: {}, body: content };
  const end = content.indexOf("\n---", 3);
  if (end === -1) return { fm: {}, body: content };

  const raw = content.slice(3, end).trim();
  const body = content.slice(end + 4);

  const fm = {};
  for (const line of raw.split("\n")) {
    const m = line.match(/^([a-zA-Z0-9_-]+)\s*:\s*(.+)$/);
    if (m) fm[m[1]] = m[2];
  }
  return { fm, body };
}

function lineNumber(text, index) {
  return text.slice(0, index).split("\n").length;
}

const contentDir = process.argv[2] || "content";
if (!fs.existsSync(contentDir)) {
  console.error(`Content directory not found: ${contentDir}`);
  process.exit(1);
}

const files = getAllFiles(contentDir);
const errors = [];

for (const file of files) {
  const raw = fs.readFileSync(file, "utf8");
  const { fm, body } = parseFrontmatter(raw);

  for (const field of REQUIRED_FRONTMATTER) {
    if (!fm[field]) {
      errors.push({ file, message: `Missing frontmatter field: ${field}` });
    }
  }

  for (const re of URGENCY_PATTERNS) {
    const m = re.exec(body);
    if (m) {
      errors.push({
        file,
        line: lineNumber(body, m.index),
        message: "Urgency language is not allowed"
      });
    }
  }

  for (const re of JOURNEY_PATTERNS) {
    const m = re.exec(body);
    if (m) {
      errors.push({
        file,
        line: lineNumber(body, m.index),
        message: "Inspirational framing is not allowed"
      });
    }
  }

  const hasCanonical = CANONICAL_TERMS.some(t =>
    body.toLowerCase().includes(t)
  );

  if (!hasCanonical) {
    errors.push({
      file,
      message: "Missing canonical burnout terminology"
    });
  }
}

if (errors.length > 0) {
  console.error("\nSoftFocus Content Validation FAILED\n");
  for (const e of errors) {
    const loc = e.line ? `:${e.line}` : "";
    console.error(`- ${e.file}${loc}`);
    console.error(`  ${e.message}`);
  }
  process.exit(1);
}

console.log("SoftFocus Content Validation PASSED");
