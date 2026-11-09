<script setup lang="ts">
import { useSlideContext } from "@slidev/client";
import { computed } from "vue";

const { $frontmatter, $page } = useSlideContext();

const FULL_BLEED = ["cover", "intro", "end", "image", "image-left", "image-right", "iframe", "iframe-left", "iframe-right", "full", "none"];

const visible = computed(() => {
  if (typeof $frontmatter.footer === "boolean") return $frontmatter.footer;
  const layout = $frontmatter.layout ?? ($page.value === 1 ? "cover" : "default");
  return !FULL_BLEED.includes(layout);
});
</script>

<template>
  <footer v-if="visible" class="paiza-footer">
    <span class="paiza-footer-page">{{ $page }}</span>
  </footer>
</template>
