#!/usr/bin/env node
import fs from "fs";

const requiredFiles = [
  "backend/config/products.json",
  "backend/config/events.schema.json"
];

let ok = true;

for (const f of requiredFiles) {
  if (!fs.existsSync(f)) {
    console.error(`Missing required file: ${f}`);
    ok = false;
  }
}

try {
  const products = JSON.parse(fs.readFileSync("backend/config/products.json", "utf8"));
  if (!products.products || products.products.length === 0) {
    console.error("products.json has no products");
    ok = false;
  }
} catch (e) {
  console.error("products.json is not valid JSON");
  ok = false;
}

if (!ok) process.exit(1);
console.log("OK backend contract checks passed");
