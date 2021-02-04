<template>
<div class="topnav">
  <router-link to="/" class="logo">
    <svg v-if="toggleMenuButtonVisible" class="pc-home">
      <use xlink:href="#icon-home"></use>
    </svg>
    <svg  v-if="toggleMenuButtonVisible"  class="mobile-home">
      <use xlink:href="#icon-home2"></use>
    </svg>
  </router-link>
  <ul class="menu">
    <li>
      <router-link to="/doc">
        <svg  v-if="!toggleMenuButtonVisible" class="icon">
           <use xlink:href="#icon-doc"></use>
        </svg>
      </router-link>
    </li>
    <li>
      <a href="https://github.com/Huixies/bingguo-ui">
       <svg  v-if="!toggleMenuButtonVisible" class="icon">
           <use xlink:href="#icon-github"></use>
       </svg>
      </a>
    </li>
  </ul>
  <span v-if="toggleMenuButtonVisible" class="toggleAside" @click="toggleMenu">
     <svg v-if="menuVisible">
       <use xlink:href="#icon-menu-fold"></use>
     </svg>
     <svg v-else>
       <use xlink:href="#icon-caidan"></use>
     </svg>
  </span>
</div>
</template>

<script lang="ts">
import { inject, Ref } from "vue";
export default {
  props: {
    toggleMenuButtonVisible: {
      type: Boolean,
      default: true
    }
  },
  setup() {
    const menuVisible = inject<Ref<boolean>>("menuVisible");
    if (menuVisible !== undefined) {
      const toggleMenu = () => {
        menuVisible.value = !menuVisible.value;
      };
      return { toggleMenu ,menuVisible };
    }
  }
};
</script>

<style lang="scss" scope>
.topnav {
  color: #ffffff;
  display: flex;
  padding: 16px;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 20;
  >.logo {
    max-width: 6em;
    margin-right: auto;
    >svg {
      width: 32px;
      height: 32px;
    }
  }
  >.menu {
    display: flex;
    white-space: nowrap;
    flex-wrap: nowrap;
    margin-top: 0.7em;
    margin-right: 0.7em;
    >li {
      margin: 0 1em;
    }
    svg{
      width: 38px;
      height: 38px;
    }
  }
  >.toggleAside {
    width: 32px;
    height: 32px;
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
   
    >svg{
      width: 38px;
      height: 38px;
    }
  }
  >.logo {
      margin-right: 0 auto;
      >.pc-home{
        margin: 1rem 0;
      }
      >.mobile-home{
         display: none;
      }
    }
    >.toggleAside {
      display: none;
    }
  @media (max-width: 500px) {
    >.menu {
      display: none;
    }
    >.logo {
      margin: 0 auto;
      >.pc-home{
        display:none;
      }
      >.mobile-home{
        display: inline;
        margin: 0 auto;
        margin-top: 0.7rem;

      }
    }
    >.toggleAside {
      display: inline-block;
    }
  }
 
}


</style>