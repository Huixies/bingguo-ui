<demo>
自定义
</demo>
<template>
  <div>
      <Slider :min="100" :max="1000" :step="100" v-model="value" />
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
    const value = ref(100) ;
    return { value };
  }
}
</script>