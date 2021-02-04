<demo>
数据绑定
</demo>
<template>
<div>
    <div class="bindDate">
      <Input v-model:value="value"></Input>
      {{value}}
      <br />
       <Input v-model:value="blurvalue" v-model="blur"></Input>
      {{blur}}
    </div>
</div>
</template>

<script lang="ts">
import { ref } from "vue";
import {
  Input
} from "../../lib/index";
export default {
  components: {
    Input
  },
   setup() {
    const value = ref("自动触发");
    const blurvalue = ref("点击后触发");
    const blur = ref("点击后触发");
    return { value,blurvalue, blur };
  },
}
</script>
