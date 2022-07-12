<script setup lang="ts">
  import Frank from './components/Frank.vue'
</script>

<template>
  <div>导航栏 | 
    <router-link to="/">Frank</router-link> | 
    <router-link to="/xxx">Frank2</router-link></div>
  <hr>
  <router-view/>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
