<template>
  <div class="slidev-layout end text-white" :class="$slidev.themeConfigs?.service">
    <div class="my-auto w-full">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.end {
  background-color: var(--slidev-theme-primary);
  color: var(--slidev-theme-anti);
}
</style>
