<template>
  <article class="markdown-body" v-html="content">
  </article>
</template>

<script lang='ts'>
export default {
    props:{
        content:{
            type:String,
            required:true
        }
    }
}
</script>

<style lang="scss" scope>
h1{
    color: rgb(197, 89, 0);
}
h4{
    color: rgb(99, 99, 99);
    font-size: 20px;
}

</style>


