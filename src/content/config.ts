import { defineCollection, z } from 'astro:content';

const reportsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    date: z.string(),
    kumi: z.number(),
    han: z.number(),
    company: z.string(),
    videoUrl: z.string().optional(),
  }),
});

export const collections = {
  reports: reportsCollection,
};
