#!/usr/bin/env node

const fs = require("fs");
const Ajv = require("ajv");

const schema = JSON.parse(
  fs.readFileSync(
    "docs/frontend/mobile/SoftFocus_Mobile_Result_Schema.json",
    "utf8"
  )
);

const data = JSON.parse(
  fs.readFileSync(process.argv[2], "utf8")
);

const ajv = new Ajv({ allErrors: true });
const validate = ajv.compile(schema);

if (!validate(data)) {
  console.error("[UI-LINT] INVALID MOBILE RESULT");
  console.error(validate.errors);
  process.exit(1);
}

console.log("[UI-LINT] PASS");
