<script setup lang="ts">
import { computed } from "vue";
import { backgroundStyle } from "../composables/background";

const props = withDefaults(defineProps<{ image?: string; backgroundSize?: string }>(), {
  backgroundSize: "cover",
});

const style = computed(() => backgroundStyle(props.image, props.backgroundSize));
</script>

<template>
  <div class="slidev-layout image" :style="style">
    <slot />
  </div>
</template>
