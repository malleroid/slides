<script setup lang="ts">
import { useSlideContext } from '@slidev/client'

const { $slidev } = useSlideContext()
const title = $slidev.configs.title
const author = $slidev.configs.author
const link = $slidev.configs.link
</script>

<template>
  <Footer :title="title" :author="author" :link="link" />
</template>
