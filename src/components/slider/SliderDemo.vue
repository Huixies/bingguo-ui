<template>
<h1>Slider 滑块</h1>
<Demo :component="Slider1Demo" />
<Demo :component="Slider2Demo" />
</template>

<script lang="ts">
import Demo from '../Demo.vue';
import Slider1Demo from './Slider1.demo.vue';
import Slider2Demo from './Slider2.demo.vue';

export default {
  components: {
    Demo
  },
  setup() {
    return {
      Slider1Demo,
      Slider2Demo
    }
  }
}
</script>
