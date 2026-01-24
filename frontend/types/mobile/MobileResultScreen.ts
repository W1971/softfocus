export type MobileResultScreen = {
  resultState: {
    label: string;
    descriptor: string;
  };
  context: string;
  excerpt: {
    title: string;
    items: [string, string] | [string, string, string];
  };
  referenceLink: {
    label: "What SoftFocus Gives";
    target: string;
  };
  closingNote?: string;
};
