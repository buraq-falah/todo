<template>
  <form @submit.prevent="addProject">
      <label for="" >title : </label>
      <input type="text" required v-model="title">
      <label for="" >details : </label>
      <textarea v-model="details" required></textarea>
      <button>Add Project</button>
  </form>
</template>

<script>
export default {
data(){
    return{
        title:"",
        details:""
    }
},
methods:{
    addProject(){
        let project={
            title:this.title,
            details:this.details,
            completed:false
        }
        fetch('http://localhost:3000/projects',{method:'POST',
        headers:{'content-type':'application/json'},
        body:JSON.stringify(project)})
        .then(()=>this.$router.push('/'))
        .catch(err=>console.log(err))
    }
}
}
</script>

<style>
form{
    background-color: #fff;
    padding: 15px;
    margin-top: 40px;
}
label{
    text-transform: uppercase;
    color: #bbb;
    letter-spacing: 1px;
    display: block;
    margin-top: 20px;
    font-weight: bold;
}
input{
    border: none;
    border-bottom: 1px solid #ddd;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    font-size: 14px;
    outline: none;
}
textarea{
    width: 100%;
    margin-top: 10px;
    border: 1px solid #ddd;
    height: 100px;
    box-sizing: border-box;
    outline: none;
    padding: 10px;
}
button{
    background-color: #2ddfa9;
    color: #fff;
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    margin-top: 20px;
    display: block;
    cursor: pointer;
}
</style>