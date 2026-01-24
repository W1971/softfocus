type SEOInput = {
  title: string;
  description: string;
  locale: string;
  indexable: boolean;
};

export function buildMetadata(input: SEOInput) {
  return {
    title: input.title,
    description: input.description,
    robots: {
      index: input.indexable,
      follow: input.indexable,
    },
    alternates: {
      languages: {
        [input.locale]: undefined,
      },
    },
  };
}
