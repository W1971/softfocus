import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';

const ROOT = 'docs/content';

let violations = [];

function scan(dir) {
  for (const entry of fs.readdirSync(dir)) {
    const full = path.join(dir, entry);
    if (fs.statSync(full).isDirectory()) scan(full);
    if (entry.endsWith('.md')) {
      const { data } = matter(fs.readFileSync(full, 'utf8'));
      if (data.noindex !== true && data.draft !== false) {
        violations.push(full);
      }
    }
  }
}

scan(ROOT);

if (violations.length) {
  console.error('INDEXING GUARD VIOLATION');
  violations.forEach(v => console.error(v));
  process.exit(1);
}

console.log('Indexing guard passed.');
