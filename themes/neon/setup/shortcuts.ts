import { defineShortcutsSetup } from "@slidev/types";

export default defineShortcutsSetup((_nav, baseShortcuts) => {
  return [
    ...baseShortcuts,
    {
      key: "w",
      fn: () => {
        window.dispatchEvent(new CustomEvent("switch-neon-theme"));
      },
      autoRepeat: false,
    },
  ];
});
