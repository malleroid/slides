<script setup lang="ts">
defineProps<{
  left: { heading: string; items: string[] }
  right: { heading: string; items: string[] }
}>()
</script>

<template>
  <div class="slidev-layout frame compare-layout">
    <div class="frame-content compare-content">
      <slot />
      <div class="compare-columns">
        <div class="compare-column compare-left">
          <div class="compare-heading compare-heading-left">{{ left.heading }}</div>
          <div class="compare-items">
            <div v-for="(item, i) in left.items" :key="i" class="compare-card compare-card-left">
              {{ item }}
            </div>
          </div>
        </div>
        <div class="compare-column compare-right">
          <div class="compare-heading compare-heading-right">{{ right.heading }}</div>
          <div class="compare-items">
            <div v-for="(item, i) in right.items" :key="i" class="compare-card compare-card-right">
              {{ item }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
