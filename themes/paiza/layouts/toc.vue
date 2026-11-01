<script setup lang="ts">
import { useSlideContext } from "@slidev/client";
import { computed } from "vue";
import { useSections } from "../composables/sections";

type Item = { title: string; speaker?: string; no?: number; number?: string };

const { $frontmatter } = useSlideContext();
const sections = useSections();

// `items` frontmatter overrides the list collected from `layout: section` slides.
const items = computed<Item[]>(() => {
  if (!$frontmatter.items) return sections.value;
  return $frontmatter.items.map((item: string | Item, index: number) => ({
    number: String(index + 1).padStart(2, "0"),
    ...(typeof item === "string" ? { title: item } : item),
  }));
});
</script>

<template>
  <div class="slidev-layout toc paiza-page">
    <slot />
    <ol class="toc-list">
      <li v-for="item in items" :key="item.title" class="toc-item">
        <span class="toc-number">{{ item.number }}</span>
        <Link v-if="item.no" :to="item.no" class="toc-title">{{ item.title }}</Link>
        <span v-else class="toc-title">{{ item.title }}</span>
        <template v-if="item.speaker">
          <span class="toc-leader" />
          <span class="toc-speaker">{{ item.speaker }}</span>
        </template>
      </li>
    </ol>
  </div>
</template>
