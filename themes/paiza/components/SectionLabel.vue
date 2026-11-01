<script setup lang="ts">
import { useSlideContext } from "@slidev/client";
import { computed } from "vue";
import { useSections } from "../composables/sections";

const { $frontmatter, $page, $slidev } = useSlideContext();
const sections = useSections();

// `section` frontmatter wins; otherwise the nearest preceding section slide, then the deck title.
const label = computed(() => {
  if ($frontmatter.section === false) return undefined;
  if ($frontmatter.section) return $frontmatter.section;
  const current = sections.value.filter((section) => section.no <= $page.value).at(-1);
  return current?.title || $slidev.configs.title;
});
</script>

<template>
  <p v-if="label" class="section-label">{{ label }}</p>
</template>
