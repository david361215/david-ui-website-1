<template>
    <div class="gulu-tabs">
        <div class="gulu-tabs-nav" ref="container">
            <div class="gulu-tabs-nav-item" :class="{selected: t===selected}" :ref="el => { if (t===selected) selectedItem = el }" @click="select(t)" v-for="(t,index) in titles" :key="index" >{{t}}</div>
            <div class="gulu-tabs-nav-indicator" ref="indicator"></div>
        </div>
        <div class="gulu-tabs-content">
            <component class="gulu-tabs-content-item" :is="current" :key="selected"/>
        </div>
    </div>
</template>

<script lang="ts">
import Tab from "./Tab.vue";
import {
    computed,
    ref,
    watchPostEffect
} from "vue";

export default {
    props:{
        selected:{
            type:String
        }
    },
    setup(props,context) {    
        const selectedItem = ref<HTMLDivElement>(null)
        const indicator = ref<HTMLDivElement>(null)
        const container = ref<HTMLDivElement>(null)

        watchPostEffect(()=>{
            const { 
                width 
            } = selectedItem.value.getBoundingClientRect()            
            indicator.value.style.width = width + 'px'
            const {
                left: left1 
            } = container.value.getBoundingClientRect()
            const { 
                left: left2 
            } = selectedItem.value.getBoundingClientRect()
            const left = left2 - left1
            indicator.value.style.left = left + 'px'
        })

        const defaults = context.slots.default()
        defaults.forEach((tag) => {
            if(tag.type !== Tab){
                throw new Error('Tabs 子标签必须是 Tab')
            }
        })
        const current = computed(() => {
            return defaults.find(tag =>  tag.props.title === props.selected)
        })
        const titles = defaults.map((tag) => {
            if(tag.props.title){
                return tag.props.title
            }
        })
        const select = (title:string) => {
            context.emit('update:selected',title)
        }
        return {
            defaults,
            titles,
            select,
            current,
            selectedItem,
            indicator,
            container
        }
    }
}
</script>

<style lang="scss">

$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.gulu-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;
    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
    }
    &-indicator {
        position: absolute;
        left: 0;
        bottom: -1px;
        width: 100px;
        height: 3px;
        background: $blue;
        transition: all 250ms;
    }
  }
  &-content {
    padding: 8px 0;
  }
}
</style>