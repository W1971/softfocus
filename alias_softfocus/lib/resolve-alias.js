import fs from "fs";
import path from "path";
import yaml from "js-yaml";

const ALIASES_PATH = path.resolve("docs/control/ALIASES.yaml");

export function resolveAlias(aliasName) {
  if (!fs.existsSync(ALIASES_PATH)) {
    throw new Error("ALIASES.yaml not found");
  }

  const raw = fs.readFileSync(ALIASES_PATH, "utf8");
  const registry = yaml.load(raw);

  if (!registry || !registry.aliases) {
    throw new Error("Invalid alias registry structure");
  }

  const alias = registry.aliases[aliasName];

  if (!alias) {
    throw new Error(`Alias '${aliasName}' not found in registry`);
  }

  if (alias.execution === "FORBIDDEN") {
    throw new Error(`Execution forbidden for alias '${aliasName}'`);
  }

  const targets = [];

  if (Array.isArray(alias.scripts)) {
    targets.push(...alias.scripts);
  }

  if (Array.isArray(alias.ci_gates)) {
    targets.push(...alias.ci_gates);
  }

  if (targets.length === 0) {
    throw new Error(`No execution targets defined for alias '${aliasName}'`);
  }

  return {
    name: aliasName,
    status: alias.status,
    execution: alias.execution,
    affectsReadiness: alias.affects_readiness,
    targets,
  };
}
