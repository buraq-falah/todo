<template>
  <div class="main-bar">
      <router-link :to="{name:'home'}">Home</router-link>
      <router-link :to="{name:'addProject'}">Add Project</router-link>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.main-bar{
    text-align: center;
    margin: 20px auto;
}
.main-bar a{
    text-decoration: none;
    color: #999;
    display: inline-block;
    margin: 0 10px;

}
a.router-link-active{
    border-bottom: 2px solid #00ec00;
    padding:4px ;
}
</style>