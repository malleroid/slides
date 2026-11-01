<script setup lang="ts">
defineProps<{ class?: string; layoutClass?: string }>();
</script>

<template>
  <div class="slidev-layout two-cols paiza-page" :class="layoutClass">
    <SectionLabel />
    <div class="two-cols-grid">
      <div class="col-left" :class="$props.class">
        <slot />
      </div>
      <div class="col-right" :class="$props.class">
        <slot name="right" />
      </div>
    </div>
  </div>
</template>
