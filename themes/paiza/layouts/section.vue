<script setup lang="ts">
import { useSlideContext } from "@slidev/client";
import { computed } from "vue";
import { useSections } from "../composables/sections";

const { $page } = useSlideContext();
const sections = useSections();

const number = computed(() => sections.value.find((section) => section.no === $page.value)?.number);
</script>

<template>
  <div class="slidev-layout section">
    <div class="section-body">
      <p v-if="number" class="section-number">{{ number }}</p>
      <slot />
    </div>
  </div>
</template>
