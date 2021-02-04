<demo>
改变大小
</demo>
<template>
<div>
  <div>
    <Button size="big">较大</Button>
    <Button>中等</Button>
    <Button size="small">较小</Button>
  </div>
  <div>
    <Button theme="link" size="big">较大</Button>
    <Button theme="link">中等</Button>
    <Button size="small" theme="link">较小</Button>
  </div>
  <div>
    <Button size="big" theme="text">较大</Button>
    <Button theme="text">中等</Button>
    <Button size="small" theme="text">较小</Button>
  </div>
</div>
</template>

<script lang="ts">
import {
  Button
} from "../../lib/index";
export default {
  components: {
    Button
  }
}
</script>
