import { defineShikiSetup } from "@slidev/types";
import theme from "./barrel.json" with { type: "json" };

export default defineShikiSetup(() => ({
  themes: {
    // biome-ignore lint/suspicious/noExplicitAny: Shiki accepts raw TextMate theme objects
    dark: theme as any,
    // biome-ignore lint/suspicious/noExplicitAny: Shiki accepts raw TextMate theme objects
    light: theme as any,
  },
}));
