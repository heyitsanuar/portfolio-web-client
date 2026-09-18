import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  output: 'static',
  site: 'https://heyitsanuar.github.io',
  base: '/portfolio-web-client',
  vite: {
    plugins: [tailwindcss()],
  },
});
