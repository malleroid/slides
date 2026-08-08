#!/usr/bin/env node

// emerald-synth took its page structure from cobalt, and barrel took it from
// emerald-synth. That lineage is deliberate — they are separate themes with
// separate palettes over one skeleton — but it means a rule can go missing in
// one of them and no build, lint or deck will notice. That is exactly how
// barrel shipped `cards` and `compare` with no CSS at all.
//
// This compares the class selectors each theme defines. Anything that exists in
// one theme and not the other is drift, and should be a decision rather than an
// accident.
//
// ALLOWED_ONLY_IN is empty and worth keeping that way: the two themes now share
// their whole class vocabulary, so a deck moves between them untouched. A name
// that only makes sense in one palette is a reason to find a neutral one, not a
// reason to add an exception.

import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

const PAIRS = [["emerald-synth", "barrel"]];

const ALLOWED_ONLY_IN = {};

function selectorsOf(theme) {
  const dir = join("themes", theme, "styles");
  const css = readdirSync(dir)
    .filter((f) => f.endsWith(".css"))
    .map((f) => readFileSync(join(dir, f), "utf8"))
    .join("\n")
    .replace(/\/\*[\s\S]*?\*\//g, "");

  const found = new Set();
  // Everything before a `{` is selector text; declaration values never are.
  for (const block of css.split("}")) {
    const selector = block.split("{")[0];
    if (!selector) continue;
    for (const match of selector.matchAll(/\.([a-z][a-z0-9-]*)/g)) {
      found.add(match[1]);
    }
  }
  return found;
}

let failed = false;

for (const [a, b] of PAIRS) {
  const [selA, selB] = [selectorsOf(a), selectorsOf(b)];
  const onlyA = [...selA].filter((s) => !selB.has(s) && !ALLOWED_ONLY_IN[a]?.includes(s));
  const onlyB = [...selB].filter((s) => !selA.has(s) && !ALLOWED_ONLY_IN[b]?.includes(s));

  if (onlyA.length === 0 && onlyB.length === 0) {
    console.log(`${a} <-> ${b}: in sync (${selA.size} selectors)`);
    continue;
  }

  failed = true;
  console.error(`${a} <-> ${b}: selector drift`);
  for (const s of onlyA.sort()) console.error(`  only in ${a}: .${s}`);
  for (const s of onlyB.sort()) console.error(`  only in ${b}: .${s}`);
}

if (failed) {
  console.error(
    "\nAdd the rule to the theme that is missing it, or list the selector in ALLOWED_ONLY_IN if the themes are meant to differ here.",
  );
  process.exit(1);
}
