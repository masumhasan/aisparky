import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  /* config options here */
  // Note: standalone output is only needed for Docker deployments
  // For Netlify, don't use standalone as it uses @netlify/plugin-nextjs
  // Uncomment the line below when building for Docker
  // output: 'standalone',
};

export default nextConfig;
