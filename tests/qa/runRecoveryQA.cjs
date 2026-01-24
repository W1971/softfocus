const fs = require("fs");
const path = require("path");
const { scoreRecovery } = require("../../scripts/core/recovery/scoreRecovery.cjs");

const fixturesDir = path.join(__dirname, "fixtures");

let failed = false;

for (const file of fs.readdirSync(fixturesDir)) {
  if (!file.endsWith(".json")) continue;

  const fixture = JSON.parse(
    fs.readFileSync(path.join(fixturesDir, file), "utf-8")
  );

  const result = scoreRecovery(fixture.answers);
  const [min, max] = fixture.expected.scoreRange;

  if (
    result.band !== fixture.expected.band ||
    result.score < min ||
    result.score > max
  ) {
    failed = true;
    console.error("❌ QA FAIL:", fixture.name, result);
  } else {
    console.log("✔ QA PASS:", fixture.name);
  }
}

if (failed) process.exit(1);
