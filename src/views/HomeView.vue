<template>
<div>
  <filterNav @filterUpdate="current = $event" :current="current"/>
  <div  v-if="projects.length" class="home">
    <div v-for="project in filterProject" :key="project.id">
      <SingelProject :project="project" @delPro="DeleteProject" @toggleCompleted="toggleDone" />
    </div>
  </div>
  <div v-else>wait please...</div>
</div>
</template>

<script>
import SingelProject from "../components/SingelProject";
import filterNav from "../components/filterNav";
export default {
  name: "HomeView",
  data() {
    return {
      current:'ALL',
      projects: []
    };
  },
  components: {
    SingelProject,filterNav
  },

  mounted() {
    fetch("http://localhost:3000/projects")
      .then(res => res.json())
      .then(data => (this.projects = data))
      .catch(err => console.log(err.message));
  },
  methods: {
    DeleteProject(id) {
      this.projects = this.projects.filter(project => {
        return project.id !== id;
      });
    },
    toggleDone(id) {
      let p = this.projects.find(project => {
        return project.id === id;
      });
      p.completed = !p.completed;
    }
  },
  computed:{
     filterProject(){
      if (this.current==='COMPLETED') {
        return this.projects.filter(project=>project.completed)
      }
       if (this.current==='ON GOING') {
        return this.projects.filter(project=> !project.completed)
      }
        return this.projects
    }
  }
};
</script>
