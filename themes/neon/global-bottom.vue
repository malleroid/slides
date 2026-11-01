<script setup lang="ts">
import { onMounted, onUnmounted, useTemplateRef } from "vue";
import { configs, useNav } from "@slidev/client";
import NeonBackground from "./components/NeonBackground.vue";
import ThemeIndicator from "./components/ThemeIndicator.vue";
import { DEFAULT_NEON_THEME, isNeonTheme } from "./composables/useNeonThemes";

const { currentPage, isPrintMode } = useNav();

const variant = configs.themeConfig?.variant;
const initialTheme = isNeonTheme(variant) ? variant : DEFAULT_NEON_THEME;

const neonRef = useTemplateRef<InstanceType<typeof NeonBackground>>("neonRef");

const getCurrentNeonTheme = () => neonRef.value?.currentNeonTheme;

// W キーは setup/shortcuts.ts が CustomEvent として発火する
const handleSwitchTheme = () => {
  neonRef.value?.switchNeonTheme();
};

onMounted(() => {
  window.addEventListener("switch-neon-theme", handleSwitchTheme);
});

onUnmounted(() => {
  window.removeEventListener("switch-neon-theme", handleSwitchTheme);
});
</script>

<template>
  <NeonBackground
    ref="neonRef"
    :visible="true"
    :slide-number="currentPage"
    :initial-theme="initialTheme"
  />

  <ThemeIndicator
    v-if="!isPrintMode"
    :neon-theme="getCurrentNeonTheme()"
    @switch-theme="() => neonRef?.switchNeonTheme()"
  />
</template>
