import { defineCollection, z } from 'astro:content';

const ru = defineCollection({
  type: 'content',
  schema: z.object({
    slug: z.string(),
    title: z.string(),
    primary_keyword: z.string(),
    draft: z.boolean().optional().default(false),
    noindex: z.boolean().optional().default(false),
  }),
});

const en = defineCollection({
  type: 'content',
  schema: z.object({
    slug: z.string(),
    title: z.string(),
    primary_keyword: z.string(),
    draft: z.boolean().optional().default(false),
    noindex: z.boolean().optional().default(false),
  }),
});

export const collections = { ru, en };
