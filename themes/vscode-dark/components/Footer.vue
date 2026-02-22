<script setup lang="ts">
defineProps<{
  title?: string
  author?: string
  link?: string
}>()
</script>

<template>
  <div class="footer">
    <div class="footer-left">
      <slot name="title">{{ title }}</slot>
    </div>
    <div class="footer-right">
      <slot name="author">
        <span v-if="author" class="footer-item">
          <carbon:logo-github class="footer-icon" />
          {{ author }}
        </span>
      </slot>
      <slot name="link">
        <span v-if="link" class="footer-item">
          <carbon:link class="footer-icon" />
          {{ link }}
        </span>
      </slot>
      <slot></slot>
    </div>
  </div>
</template>

<style scoped>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  display: flex;
  z-index: 100;
  height: 1.75rem;
}

.footer-left {
  display: flex;
  align-items: center;
  padding: 0 0.75rem;
  background: linear-gradient(90deg, #4ec9b0 0%, #16825d 100%);
  color: white;
  font-size: 0.875rem;
  font-weight: 500;
  white-space: nowrap;
}

.footer-right {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  flex: 1;
  padding: 0 0.75rem;
  background: #007acc;
  gap: 1.5rem;
  color: white;
  font-size: 0.75rem;
}

.footer-item {
  display: flex;
  align-items: center;
  gap: 0.375rem;
}

.footer-icon {
  width: 0.875rem;
  height: 0.875rem;
}
</style>
