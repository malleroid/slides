<script setup lang="ts">
import { computed } from "vue";
import { backgroundStyle } from "../composables/background";

const props = withDefaults(defineProps<{ image?: string; class?: string; backgroundSize?: string }>(), {
  backgroundSize: "cover",
});

const style = computed(() => backgroundStyle(props.image, props.backgroundSize));
</script>

<template>
  <div class="slidev-layout image-right">
    <div class="paiza-page" :class="props.class">
      <SectionLabel />
      <slot />
    </div>
    <div class="image-pane" :style="style" />
  </div>
</template>
