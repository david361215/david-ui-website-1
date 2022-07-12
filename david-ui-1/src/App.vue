<script lang="ts">
  import {ref,provide} from 'vue'

  export default{
    name:'App',
    setup(){
      let asideVisible = ref( document.documentElement.clientWidth <=500 ?false:true)
      window.onresize = ()=>{
        document.documentElement.clientWidth > 500 ?
          asideVisible.value = true:
          asideVisible.value = false;
        provide('asideVisible',asideVisible)
      }
      provide('asideVisible',asideVisible)
    }
  }

</script>

<template>
  <router-view/>
</template>