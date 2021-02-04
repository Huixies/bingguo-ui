<demo>
基础用法 
</demo>
<template>
  <div>
      <Slider v-model="value" />
      <p>Value: {{ value }}</p>
  </div>
</template>

<script>
import { ref } from 'vue';
import {
  Slider
} from "../../lib/index";

export default {
  components: {
     Slider
  },
  setup() {
    const value = ref(0) ;
    return { value };
  }
}
</script>