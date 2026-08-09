<template>
  <div class="slidev-layout toc" :class="$slidev.themeConfigs?.service">
    <div class="grid grid-cols-4 h-full" style="">
      <div class="toc-title flex items-center justify-center">
        <h1>TABLE OF CONTENTS</h1>
      </div>
      <div class="content col-span-3 h-full">
        <slot />
      </div>
    </div>
  </div>
</template>
