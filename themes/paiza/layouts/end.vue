<script setup lang="ts">
import logo from "../assets/logo-white.svg";
</script>

<template>
  <div class="slidev-layout end">
    <div class="end-body">
      <slot />
      <img :src="logo" alt="paiza" class="end-logo" />
    </div>
  </div>
</template>
