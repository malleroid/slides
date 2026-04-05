import { defineConfig } from "unocss";

export default defineConfig({
  theme: {
    colors: {
      "es-bg-darkest": "var(--es-bg-darkest)",
      "es-bg": "var(--es-bg)",
      "es-bg-medium": "var(--es-bg-medium)",
      "es-bg-sidebar": "var(--es-bg-sidebar)",
      "es-bg-raised": "var(--es-bg-raised)",

      "es-fg": "var(--es-fg)",
      "es-fg-dim": "var(--es-fg-dim)",
      "es-fg-dark": "var(--es-fg-dark)",
      "es-fg-muted": "var(--es-fg-muted)",

      "es-accent": "var(--es-accent)",
      "es-accent-text": "var(--es-accent-text)",
      "es-accent-border": "var(--es-accent-border)",

      "es-success": "var(--es-success)",
      "es-warning": "var(--es-warning)",
      "es-error": "var(--es-error)",
      "es-info": "var(--es-info)",

      "es-white": "var(--es-white)",
    },
  },
});
