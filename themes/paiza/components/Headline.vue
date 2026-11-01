<script setup lang="ts">
defineProps<{ title: string; subtitle?: string }>();
</script>

<template>
  <div class="headline">
    <p class="headline-title">{{ title }}</p>
    <p v-if="subtitle" class="headline-subtitle">{{ subtitle }}</p>
  </div>
</template>
