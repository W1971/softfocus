export type B2BDocument = {
  title: string;
  version: string;
  audience: string;
  sections: {
    heading: string;
    body: string[];
  }[];
  complianceBoundary: string;
};
