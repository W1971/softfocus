#!/usr/bin/env node

import fs from "fs";
import path from "path";

const CONFIG_PATH = path.join(
  process.cwd(),
  "backend/config/content-rules.json"
);

const config = JSON.parse(fs.readFileSync(CONFIG_PATH, "utf8"));

/* ----------------------------
 * Utilities
 * ---------------------------- */
function getAllFiles(dir, exts = [".md", ".mdx", ".txt"]) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) out.push(...getAllFiles(full, exts));
    else if (exts.includes(path.extname(entry.name))) out.push(full);
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
    if (m) fm[m[1]] = m[2].replace(/^["']|["']$/g, "");
  }
  return { fm, body };
}

function lineNumber(text, index) {
  return text.slice(0, index).split("\n").length;
}

/* ----------------------------
 * Execution
 * ---------------------------- */
const contentDir = process.argv[2] || "content";
const files = getAllFiles(contentDir);

const errors = [];
const warnings = [];

for (const file of files) {
  const raw = fs.readFileSync(file, "utf8");
  const { fm, body } = parseFrontmatter(raw);
  const bodyLower = body.toLowerCase();

  const type = fm.type || "blog";
  const locale = fm.locale || "en-US";

  /* Frontmatter */
  for (const field of config.requiredFrontmatter) {
    if (!fm[field]) {
      errors.push({ file, message: `Missing frontmatter field: ${field}` });
    }
  }

  /* Prohibited patterns */
  for (const [key, patterns] of Object.entries(config.prohibitedPatterns)) {
    for (const p of patterns) {
      const re = new RegExp(p, "i");
      const m = re.exec(body);
      if (!m) continue;

      const severity = config.severity[key];
      const bucket = severity === "FAIL" ? errors : warnings;

      bucket.push({
        file,
        line: lineNumber(body, m.index),
        message: `${key} language detected`
      });
    }
  }

  /* Canonical terminology */
  const terms =
    config.canonicalTerms?.[locale]?.[type] ||
    config.canonicalTerms?.[locale]?.["blog"] ||
    [];

  const hasCanonical = terms.some(t => bodyLower.includes(t));

  if (!hasCanonical) {
    const severity =
      config.severity.canonical_missing?.[type] || "WARN";

    const bucket = severity === "FAIL" ? errors : warnings;

    bucket.push({
      file,
      message: "Missing canonical burnout terminology"
    });
  }
}

/* ----------------------------
 * Output
 * ---------------------------- */
if (warnings.length > 0) {
  console.warn("\nSoftFocus Content Validation WARNINGS\n");
  for (const w of warnings) {
    const loc = w.line ? `:${w.line}` : "";
    console.warn(`- ${w.file}${loc}`);
    console.warn(`  ${w.message}`);
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

console.log("\nSoftFocus Content Validation PASSED");
