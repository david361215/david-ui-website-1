<script setup lang="ts">
  import {
    ref,
    provide
  } from 'vue'
  import {
    router
  } from './router'

  const width =  document.documentElement.clientWidth;
  const asideVisible = ref( width<=500 ?false:true)
  window.onresize = () => {
    width > 500 ?
      asideVisible.value = true:
      asideVisible.value = false;
    provide('asideVisible',asideVisible)
  }
  provide('asideVisible',asideVisible)
  router.afterEach(() => {
    if (width <= 500) {
      asideVisible.value = false;
    } 
  })
</script>

<template>
<router-view/>
</template>