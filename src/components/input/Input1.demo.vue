<demo>
基础用法
</demo>
<template>
<div>
    <div class="easy">
      <Input placeholder="请输入内容"></Input>
      <Input value="不可输入" readonly></Input>
      <Input value="不可输入" disabled></Input>
    </div>
    <div class="error">
      <Input value="123" v-model:error="errorMessage"></Input>
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
    const errorMessage = ref("用户名错误");
    return {
      errorMessage,
    };
  },
}
</script>
