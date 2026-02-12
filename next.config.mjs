/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,

  experimental: {
    externalDir: true
  },

  async redirects() {
    return [
      {
        source: "/en/burnout-test-for-executives",
        destination: "/assessment?role=executives&locale=en",
        permanent: false
      }
    ];
  }
};

export default nextConfig;
