<script setup lang="ts">
import logo from "../assets/logo.svg";
</script>

<template>
  <div class="slidev-layout intro">
    <div class="intro-body">
      <slot />
    </div>
    <img :src="logo" alt="paiza" class="intro-logo" />
  </div>
</template>
