<template>
  <div class="slidev-layout intro" :class="$slidev.themeConfigs?.service">
    <div class="grid grid-cols-4 h-full" style="">
      <div class="band-title flex items-center justify-center">
        <h1></h1>
      </div>
      <div class="content col-span-3 h-full flex items-center">
        <div>
          <slot />
        </div>
      </div>
    </div>
  </div>
</template>
