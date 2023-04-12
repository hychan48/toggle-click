import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { VitePWA } from 'vite-plugin-pwa'
//https://vite-pwa-org.netlify.app/guide/

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue(),VitePWA({ registerType: 'autoUpdate' })],
  base:'/toggle-click/'
})
