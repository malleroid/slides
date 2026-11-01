<script setup lang="ts">
import logo from "../assets/logo-white.svg";
</script>

<template>
  <div class="slidev-layout cover">
    <div class="cover-body">
      <slot />
    </div>
    <img :src="logo" alt="paiza" class="cover-logo" />
  </div>
</template>
