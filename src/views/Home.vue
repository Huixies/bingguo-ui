<template>
<div>
   <div class="topnavAndBanner">
    <Topnav :toggleMenuButtonVisible="false" />
    <div class="banner">
      <div class="bg-logo">
         <img src="../../public/logo.png">
      </div>
      <h1>冰果</h1>
      <h2>一个简单易用的组件库</h2>
      <p class="actions">
        <a href="https://github.com/Huixies/bingguo-ui">GitHub</a>
        <router-link to="/doc">Start</router-link>
      </p>
    </div>
  </div>
 
 
</div>
</template>

<script lang="ts">
import Topnav from "../components/Topnav.vue";

export default {
  components: { Topnav },
};
</script>

<style lang="scss" scoped>
.topnavAndBanner{
  background:  rgb(12,32,37);
  background: linear-gradient(180deg, rgb(255, 94, 0) 0%,  rgb(238, 135, 51) 67%, rgba(238, 135, 51) 67%, rgba(255,255,255,1) 67%, rgba(238, 135, 51) 68%, rgba(255,255,255,1) 68%, rgba(238, 135, 51) 69%, rgb(255, 255, 255) 69%, rgb(255, 255, 255) 100%);
  @media (max-width: 1000px) {
       background:  rgb(12,32,37);
       background: linear-gradient(180deg,  rgb(255, 94, 0) 0%,  rgb(238, 135, 51) 97%, rgba(238, 135, 51) 97%, rgba(255,255,255,1) 97%, rgba(238, 135, 51) 98%, rgba(255,255,255,1) 98%, rgba(238, 135, 51) 99%, rgb(255, 255, 255) 99%, rgb(255, 255, 255) 100%);
  }
}
.banner {
  color:  rgb(255, 255, 255);
  display: flex;
  min-height: 100vh;
  height: 100%;
  align-items: center;
  flex-direction: column;
  > .actions {
    padding: 18px 0;
    a {
      margin: 0 8px;
      color: rgb(255, 255, 255);
      border: 2px solid rgb(255, 255, 255);
      display: inline-block;
      padding: 8px 24px;
      border-radius:6px;
      &:hover{
        text-decoration:none;
      }
    }
  }
}
img {
  margin-top: 100px;
  width: 230px;  
  }
h1{
  color: white;
  letter-spacing:0.2em;
  font-size:4.2em;
  font-weight:bold;
}
</style>
