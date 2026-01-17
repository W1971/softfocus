#!/usr/bin/env node

/**
 * SoftFocus Content Validator v1.4.1
 * Boundary-aware, zone-aware, archive-safe
 */

const fs = require('fs');
const path = require('path');

const ROOT = process.cwd();
const DOCS_DIR = path.join(ROOT, 'docs');

/* -----------------------------
   CONFIG
----------------------------- */

const ZONES = [
  { name: 'STRICT',  path: '/docs/assessment/' },
  { name: 'PUBLIC',  path: '/docs/public/' },
  { name: 'B2B',     path: '/docs/b2b/' },
  { name: 'PRODUCT', path: '/docs/product/' },
];

const CLINICAL_TERMS = [
  /\bdiagnos(e|is|tic)\b/i,
  /\btherapy|therapeutic\b/i,
  /\btreatment\b/i,
  /\bmental health\b/i,
];

const BOUNDARY_REGEX =
  /(Scope\s*&\s*Compliance\s*Boundary|Boundary\s*Notice|Non-Clinical\s*Scope\s*Declaration)/i;

/* -----------------------------
   UTILS
----------------------------- */

function walk(dir, files = []) {
  fs.readdirSync(dir).forEach(entry => {
    const fullPath = path.join(dir, entry);
    if (fs.statSync(fullPath).isDirectory()) {
      walk(fullPath, files);
    } else if (fullPath.endsWith('.md')) {
      files.push(fullPath);
    }
  });
  return files;
}

function zoneFor(filePath) {
  const norm = filePath.replace(ROOT, '');
  return ZONES.find(z => norm.includes(z.path))?.name || null;
}

/* -----------------------------
   VALIDATION
----------------------------- */

let violations = 0;
console.log('[CONTENT] Validation started (v1.4.1, boundary-aware)');

const files = walk(DOCS_DIR);

for (const filePath of files) {

  // A) ARCHIVE IS WRITE-ONLY — ALWAYS SKIP
  if (filePath.includes('/archive/')) {
    continue;
  }

  const zone = zoneFor(filePath);
  if (!zone) continue;

  const content = fs.readFileSync(filePath, 'utf8');
  const hasBoundary = BOUNDARY_REGEX.test(content);

  for (const term of CLINICAL_TERMS) {
    if (!term.test(content)) continue;

    // STRICT: zero tolerance
    if (zone === 'STRICT') {
      console.log(
        `[CONTENT][STRICT][BLOCK][CLINICAL_TERM] ${filePath}`
      );
      violations++;
      continue;
    }

    // Non-STRICT: boundary required
    if (!hasBoundary) {
      console.log(
        `[CONTENT][${zone}][BLOCK][CLINICAL_TERM_WITHOUT_BOUNDARY] ${filePath}`
      );
      violations++;
      continue;
    }

    console.log(
      `[CONTENT][${zone}][ALLOW][BOUNDARY_PRESENT] ${filePath}`
    );
  }
}

/* -----------------------------
   RESULT
----------------------------- */

if (violations > 0) {
  console.log(`[CONTENT] RESULT: BLOCK (${violations} violations)`);
  process.exit(1);
}

console.log('[CONTENT] RESULT: PASS');
process.exit(0);
