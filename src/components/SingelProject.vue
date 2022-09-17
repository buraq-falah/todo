<template>
  <div class="project" :class="{projCompleted:project.completed}">
    <div class="actions">
      <h3 @click="showDetails=!showDetails">{{project.title}}</h3>
      <div class="icons">
        <span class="material-symbols-sharp" @click="delPro">delete</span>
        <router-link :to="{name:'editProject',params:{id:project.id}}" ><span class="material-symbols-sharp">edit</span></router-link>
        <span class="material-symbols-sharp done" @click="toggleCompleted">done</span>
      </div>
    </div>
    <p v-show="showDetails">{{project.details}}</p>
  </div>
</template>

<script>
export default {
  props: ["project"],
  data() {
    return {
      showDetails:false,
      uri: "http://localhost:3000/projects/" + this.project.id
    };
  },
  methods: {
    delPro() {
      fetch(this.uri, { method: "DELETE" })
        .then(() => this.$emit("delPro", this.project.id))
        .catch(err => console.log(err));
    },
    toggleCompleted() {
      fetch(this.uri, {
        method: "PATCH",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ completed: !this.project.completed })
      })
        .then(() => this.$emit("toggleCompleted", this.project.id))
        .catch(err => console.log(err));
    },
  
  }
};
</script>

<style>
body {
  background-color: #f2f2f2;
}

.project {
  background-color: #fff;
  border-radius: 4px;
  border-left: 5px solid #e93378;
  padding:  15px;
  margin-bottom: 25px;
}
.actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.material-symbols-sharp {
  margin-left: 5px;
  font-size: 24px;
  color: #bbb;
  cursor: pointer;
}
.material-symbols-sharp:hover {
  color: #777;
}
.project.projCompleted .done {
  color: #2ddfa9;
}

.project.projCompleted {
  border-left: 5px solid #0da577;
}
.project h3{
  cursor: pointer;
}
</style>