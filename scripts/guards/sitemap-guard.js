import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';

const CONTENT_ROOT = 'docs/content/ru';
const SITEMAP = 'public/sitemap.xml';

const sitemap = fs.readFileSync(SITEMAP, 'utf8');

function scan(dir) {
  for (const entry of fs.readdirSync(dir)) {
    const full = path.join(dir, entry);
    if (fs.statSync(full).isDirectory()) {
      scan(full);
    } else if (entry.endsWith('.md')) {
      const file = fs.readFileSync(full, 'utf8');
      const { data } = matter(file);

      if (data.noindex === true) {
        const url = `/ru/${data.slug}`;
        if (sitemap.includes(url)) {
          console.error('SITEMAP GUARD VIOLATION:', url);
          process.exit(1);
        }
      }
    }
  }
}

scan(CONTENT_ROOT);
console.log('Sitemap guard passed.');
