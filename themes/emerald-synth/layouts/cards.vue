<script setup lang="ts">
defineProps<{
  cards: Array<{ title: string; description: string }>
}>()
</script>

<template>
  <div class="slidev-layout frame cards-layout">
    <div class="frame-content cards-content">
      <slot />
      <div class="cards-container">
        <div v-for="(card, i) in cards" :key="i" class="card">
          <div class="card-title">{{ card.title }}</div>
          <div class="card-description">{{ card.description }}</div>
        </div>
      </div>
    </div>
  </div>
</template>
