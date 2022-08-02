<template>
  <h1>Dialog 示例</h1>
  <Demo :component="Dialog1Demo"/>
  <Demo :component="Dialog2Demo"/>
</template>

<script lang="ts">
import Dialog1Demo from './Dialog1.Demo.vue'
import Dialog2Demo from './Dialog2.Demo.vue'
import Demo from './Demo.vue'

export default {
  components: {
    Demo
  },
  setup() {
    return {
      Dialog1Demo,
      Dialog2Demo
    }
  }
}
</script>