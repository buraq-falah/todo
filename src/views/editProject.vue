<template>
  <form @submit.prevent="editProject">
    <label for>title :</label>
    <input type="text" v-model="title" />
    <label for>details :</label>
    <textarea v-model="details"></textarea>
    <button>edit Project</button>
  </form>
</template>

<script>
export default {
  props: ["id"],
  data() {
    return {
      title: "",
      details: "",
      uri: "http://localhost:3000/projects/" + this.id
    };
  },
  mounted() {
    fetch(this.uri)
      .then(res => res.json())
      .then(data => {
        (this.title = data.title), (this.details = data.details);
      })
      
  },
  methods: {
    editProject() {
      fetch(this.uri, {
        method: "PATCH",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ title: this.title, details: this.details })
      })
        .then(() => {
          this.$router.push("/");
        })
        .catch(err => console.log(err));
    }
  }
};
</script>

<style>
</style>