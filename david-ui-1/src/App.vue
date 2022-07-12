<script lang="ts">
  import {ref,provide} from 'vue'

  export default{
    name:'App',
    setup(){
      const asideVisible = ref(false);
      provide('xxx',asideVisible)
    }
  }

</script>

<template>
  <router-view/>
</template>