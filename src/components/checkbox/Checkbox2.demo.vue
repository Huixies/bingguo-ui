<demo>
布尔选项
</demo>
<template>
  <Checkbox v-model="checked">{{ checked ? 'Yes' : 'No' }}</Checkbox>
</template>

<script lang="ts">
import { ref } from 'vue';
import {
  Checkbox
} from "../../lib/index";
export default {
  components: {
    Checkbox
  },
  setup() {
    let checked = ref(false);
    return { checked };
  }
}
</script>