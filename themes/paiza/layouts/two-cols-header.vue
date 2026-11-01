<script setup lang="ts">
defineProps<{ class?: string; layoutClass?: string }>();
</script>

<template>
  <div class="slidev-layout two-cols-header paiza-page" :class="layoutClass">
    <SectionLabel />
    <div class="col-header">
      <slot />
    </div>
    <div class="two-cols-grid">
      <div class="col-left" :class="$props.class">
        <slot name="left" />
      </div>
      <div class="col-right" :class="$props.class">
        <slot name="right" />
      </div>
    </div>
    <div class="col-bottom" :class="$props.class">
      <slot name="bottom" />
    </div>
  </div>
</template>
