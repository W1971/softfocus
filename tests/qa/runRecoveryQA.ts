import fs from "fs";
import path from "path";
import { scoreRecovery } from "../../frontend/engine/recovery/scoreRecovery";

type Fixture = {
  name: string;
  answers: Record<string, number>;
  expected: {
    band: string;
    scoreRange: [number, number];
  };
};

const fixturesDir = path.join(__dirname, "fixtures");

let failed = false;

for (const file of fs.readdirSync(fixturesDir)) {
  const fixture: Fixture = JSON.parse(
    fs.readFileSync(path.join(fixturesDir, file), "utf-8")
  );

  const result = scoreRecovery(fixture.answers as any);

  const [min, max] = fixture.expected.scoreRange;

  const bandOk = result.band === fixture.expected.band;
  const scoreOk = result.score >= min && result.score <= max;

  if (!bandOk || !scoreOk) {
    failed = true;
    console.error("❌ QA FAIL:", fixture.name, result);
  } else {
    console.log("✔ QA PASS:", fixture.name);
  }
}

if (failed) {
  process.exit(1);
}
