<script setup lang="ts">
import { useSlideContext } from "@slidev/client";
import { computed } from "vue";
import logo from "./assets/logo.svg";

const { $frontmatter, $page, $slidev } = useSlideContext();

const FULL_BLEED = ["cover", "intro", "end", "image", "image-left", "image-right", "iframe", "iframe-left", "iframe-right", "full", "none"];

const visible = computed(() => {
  if (typeof $frontmatter.footer === "boolean") return $frontmatter.footer;
  const layout = $frontmatter.layout ?? ($page.value === 1 ? "cover" : "default");
  return !FULL_BLEED.includes(layout);
});

const copyright = computed(() => $slidev.themeConfigs.copyright ?? "© paiza, Inc.");
</script>

<template>
  <footer v-if="visible" class="paiza-footer">
    <img :src="logo" alt="paiza" class="paiza-footer-logo" />
    <span v-if="copyright" class="paiza-footer-copyright">{{ copyright }}</span>
    <span class="paiza-footer-page">{{ $page }}</span>
  </footer>
</template>
