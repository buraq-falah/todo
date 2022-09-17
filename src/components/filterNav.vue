<template>
  <div class="filterNav">
      <button @click="filterUpdate('ALL')" :class="{active:current==='ALL'}">ALL</button>
      <button @click="filterUpdate('COMPLETED')" :class="{active:current==='COMPLETED'}">COMPLETED</button>
      <button @click="filterUpdate('ON GOING')" :class="{active:current==='ON GOING'}">ON GOING</button>
  </div>
</template>

<script>
export default {
    props:['current'],
    methods:{
    filterUpdate(by){
        return this.$emit('filterUpdate',by)
    }
    }
}
</script>

<style>

.filterNav button{
    background-color: transparent;
    display: inline-block;
    color: #bbb;
    margin-right: 10px;
    padding-left: 0;
}
.filterNav .active{
    color: #555;
    font-weight: bold;
}
</style>