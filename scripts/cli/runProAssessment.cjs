#!/usr/bin/env node
/**
 * SoftFocus CLI — PRO Assessment Runner (Phase D compliant)
 * - Builds Result Contract from aggregated section signals
 * - Delegates canonical meaning to scoreRecovery.cjs (source of truth)
 * - Validates output against app/shared/contracts/result.contract.schema.json
 *
 * Usage:
 *   node scripts/cli/runProAssessment.cjs --input ./input.answers.json --locale ru-RU --role executive --entitled false
 */

const fs = require('fs');
const path = require('path');

const { buildResultContract } = require('./lib/buildResultContract.cjs');
const { validateResultContract } = require('./lib/validateResultContract.cjs');

function readJson(filePath) {
  const abs = path.resolve(process.cwd(), filePath);
  const raw = fs.readFileSync(abs, 'utf8');
  return JSON.parse(raw);
}

function getArg(name, fallback = null) {
  const idx = process.argv.indexOf(`--${name}`);
  if (idx === -1) return fallback;
  const v = process.argv[idx + 1];
  if (!v || v.startsWith('--')) return fallback;
  return v;
}

function getBoolArg(name, fallback = false) {
  const v = getArg(name, null);
  if (v === null) return fallback;
  return String(v).toLowerCase() === 'true';
}

function die(msg) {
  process.stderr.write(String(msg) + '\n');
  process.exit(1);
}

(async function main() {
  const inputPath = getArg('input');
  if (!inputPath) die('Missing --input <file.json>');

  const locale = getArg('locale', 'ru-RU');
  const role = getArg('role', 'unknown');
  const entitled = getBoolArg('entitled', false);

  const input = readJson(inputPath);

  // input format (Phase D friendly):
  // {
  //   "period_days": 14,
  //   "scale_labels": ["...", "...", "...", "..."],
  //   "sections": {
  //     "latency": [0,1,2,...],
  //     "residual": [...],
  //     "compensation": [...],
  //     "predictability": [...],
  //     "detachment": [...]
  //   }
  // }

  const contract = await buildResultContract({
    input,
    locale,
    role,
    entitled
  });

  const schemaPath = path.resolve(process.cwd(), 'app/shared/contracts/result.contract.schema.json');
  const schema = readJson(schemaPath);

  const validation = validateResultContract(contract, schema);
  if (!validation.ok) {
    die('Result Contract validation FAILED:\n' + validation.errors.map(e => `- ${e}`).join('\n'));
  }

  process.stdout.write(JSON.stringify(contract, null, 2) + '\n');
})().catch(err => {
  process.stderr.write((err && err.stack) ? err.stack + '\n' : String(err) + '\n');
  process.exit(1);
});
