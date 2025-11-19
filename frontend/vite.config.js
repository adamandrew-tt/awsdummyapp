import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

// https://vite.dev/config/
export default () => {
  // const proxyTarget = "http://127.0.0.1:80";
  return defineConfig({
    plugins: [react(), tailwindcss()],
    // server: {
    //   proxy: {
    //     "/api": {
    //       target: proxyTarget,
    //       changeOrigin: true,
    //       secure: false,
    //       ws: true,
    //     },
    //   },
    // },
  });
};
