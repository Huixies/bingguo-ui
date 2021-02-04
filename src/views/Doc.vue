<template>
  <div class="layout">
  
    <Topnav toggleMenuButtonVisible class="nav" />
   
    <div class="content">
      <aside v-if="menuVisible">
        <h2>文档</h2>
        <ol>
          <li>
            <router-link to="/doc/intro">介绍</router-link>
          </li>
          <li>
            <router-link to="/doc/install">安装</router-link>
          </li>
          <li>
            <router-link to="/doc/get-started">开始</router-link>
          </li>
        </ol>
        <h2>组件列表</h2>
        <ol>
          <li>
            <router-link to="/doc/switch">
              <svg class="icon">
                <use xlink:href="#icon-switch"></use>
              </svg>
              Switch
            </router-link>
          </li>
          <li>
            <router-link to="/doc/button">
              <svg class="icon">
                <use xlink:href="#icon-button"></use>
              </svg>
            Button</router-link>
          </li>
          <li>
            <router-link to="/doc/dialog">
              <svg class="icon">
                <use xlink:href="#icon-dialog"></use>
              </svg>
            Dialog</router-link>
          </li>
          <li>
            <router-link to="/doc/tabs">
             <svg class="icon">
                <use xlink:href="#icon-tabs"></use>
              </svg>
            Tabs</router-link>
          </li>
          <li>
            <router-link to="/doc/input">
             <svg class="icon">
                <use xlink:href="#icon-input"></use>
              </svg>
            Input</router-link>
          </li>
           <li>
            <router-link to="/doc/checkbox">
             <svg class="icon">
                <use xlink:href="#icon-checkbox"></use>
              </svg>
            Checkbox</router-link>
          </li>
           <li>
            <router-link to="/doc/slider">
             <svg class="icon">
                <use xlink:href="#icon-slider"></use>
              </svg>
            Slider</router-link>
          </li>
        </ol>
      </aside>
      <main>
        <router-view />
      </main>
    </div>
  </div>
</template>

<script lang="ts">
import Topnav from "../components/Topnav.vue";
import { inject, Ref } from "vue";

export default {
  components: { Topnav },
  setup() {
    const menuVisible = inject<Ref<boolean>>("menuVisible");

    return { menuVisible };
  },
};
</script>

<style lang="scss" scoped>

.layout {
  display: flex;
  flex-direction: column;
  height: 100vh;

  > .nav {
    flex-shrink: 0;
  }
  > .content {
    flex-grow: 1;
    padding-top: 95px;
    padding-left: 220px;
    @media (max-width: 500px) {
      padding-left: 0;
    }
  }
}
.content {
  display: flex;
  > aside {
    padding-top: 8vh;
    flex-shrink: 0;
    z-index: 1;
  }
  > main {
    flex-grow: 1;
    padding: 16px;
    overflow: hidden;
    @media (max-width: 1000px) {
       margin:0 4rem;
    }
    @media (max-width: 800px) {
       margin:0 1rem;
    }
   
  }
}
aside {
  background:  rgb(12,32,37);
  background: linear-gradient(180deg,  rgb(255, 94, 0) 0%,  rgb(238, 135, 51) 67%, rgba(238, 135, 51) 67%, rgba(255,255,255,1) 67%, rgba(238, 135, 51) 68%, rgba(255,255,255,1) 68%, rgba(238, 135, 51) 69%, rgb(255, 255, 255) 69%, rgb(255, 255, 255) 100%);
  @media (max-width: 1000px) {
       background:  rgb(12,32,37);
       background: linear-gradient(180deg,  rgb(255, 94, 0) 0%,  rgb(238, 135, 51) 97%, rgba(238, 135, 51) 97%, rgba(255,255,255,1) 97%, rgba(238, 135, 51) 98%, rgba(255,255,255,1) 98%, rgba(238, 135, 51) 99%, rgb(255, 255, 255) 99%, rgb(255, 255, 255) 100%);
    }
  width: 190px;
  padding: 16px 0;
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  color: rgb(255, 255, 255);
  > h2 {
    margin-top:20px ;
    font-weight:bold;
    padding: 0 16px;
  }
  > ol {
    > li {
      >a{
          display: block;
           padding: 4px 16px;
           text-decoration: none;
      }
      .router-link-active{
          background: white;
          font-weight:bold;
          color:rgb(238, 135, 51);
}
    }
  }
}
.icon{
  max-width: 6em;
  width: 28px;
  height: 28px;
  padding-top: 0.4rem;
  margin-top: 0.2rem;
  margin-right: 0.4rem;
}
</style>
