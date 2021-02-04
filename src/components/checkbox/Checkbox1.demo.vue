<demo>
基础用法
</demo>
<template>
  <Checkbox name="fruit" value="apple" v-model="grp">Apple</Checkbox>
  <Checkbox name="fruit" value="banana" v-model="grp">Banana</Checkbox>
  <Checkbox name="fruit" value="orange" v-model="grp">Orange</Checkbox>
  <Checkbox name="fruit" value="melon" v-model="grp">Melon</Checkbox>
  <p>Checked: {{ grp }}</p>
</template>

<script lang="ts">
import {
  Checkbox
} from "../../lib/index";
import { reactive } from 'vue';
export default {
  components: {
    Checkbox
  },
  setup() {
    let grp = reactive(['apple']);
    return { grp };
  }
}
</script>