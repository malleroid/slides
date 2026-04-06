import { defineConfig } from "unocss";

export default defineConfig({
  theme: {
    colors: {
      "br-bg-darkest": "var(--br-bg-darkest)",
      "br-bg": "var(--br-bg)",
      "br-bg-medium": "var(--br-bg-medium)",
      "br-bg-sidebar": "var(--br-bg-sidebar)",
      "br-bg-raised": "var(--br-bg-raised)",

      "br-fg": "var(--br-fg)",
      "br-fg-dim": "var(--br-fg-dim)",
      "br-fg-dark": "var(--br-fg-dark)",
      "br-fg-muted": "var(--br-fg-muted)",

      "br-accent": "var(--br-accent)",
      "br-accent-text": "var(--br-accent-text)",
      "br-accent-border": "var(--br-accent-border)",

      "br-success": "var(--br-success)",
      "br-warning": "var(--br-warning)",
      "br-error": "var(--br-error)",
      "br-info": "var(--br-info)",

      "br-white": "var(--br-white)",
    },
  },
});
