<template>
  <div class="bg-slider">
    <div class="bg-slider-inner" @mousedown.prevent="startDragHandle">
      <div class="bg-slider-track" ref="trackRef">
        <div class="bg-slider-bar" :style="`width: ${pct}%;`" />
      </div>
      <div class="bg-slider-handle" :style="`left: ${pct}%`"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref, SetupContext } from 'vue';

export default {
  props: {
    modelValue: {
      type: Number,
      default: 0,
    },
    min: {
      type: Number,
      default: 0,
    },
    max: {
      type: Number,
      default: 100,
    },
    step: {
      type: Number,
      default: 1,
    },
  },
  setup(props, { emit }: SetupContext) {
    let pct = ref(value2pct(props.modelValue, props.min, props.max));
    let trackRef = ref<HTMLElement>();

    let startX = 0, width = 0;
    function startDragHandle(evt: MouseEvent) {
      let rect = trackRef.value!.getBoundingClientRect();
      width = rect.width;
      let dx = evt.clientX - rect.left;
      setValue(dx);
      startX = evt.clientX - dx;
      document.addEventListener('mousemove', dragHandle);
      document.addEventListener('mouseup', stopDragHandle, { once: true });
    }

    function dragHandle(evt: MouseEvent) {
      let dx = evt.clientX - startX;
      setValue(dx);
    }

    function setValue(dx: number) {
      dx = Math.max(dx, 0);
      dx = Math.min(dx, width);
      let v = dx / width * 100;
      pct.value = v;
      emit('update:modelValue', pct2value(v, props.min, props.max, props.step));
    }

    function stopDragHandle(evt: MouseEvent) {
      evt.preventDefault();
      document.removeEventListener('mousemove', dragHandle);
    }
    return {
      pct, startDragHandle, trackRef,
    };
  }
}

function value2pct(value: number, min: number, max: number): number {
  let pct = (value - min) / (max - min);
  pct = Math.min(100, Math.max(pct, 0));
  return pct;
}

function pct2value(pct: number, min: number, max: number, step: number): number {
  let v = min + (max - min) * pct / 100;
  let r = Math.floor((v - min) / step);
  let m = min + r * step;
  let n = m + step;
  if (v - m <= n - v) {
    return m;
  }
  return n;
}

</script>

<style lang="scss">
$shadow: 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
$margin: 0.4rem;
.bg-slider {
  display: inline-block;
  width: 15rem;
  
  .bg-slider-inner {
    display: flex;
    align-items: center;
    position: relative;
    padding: $margin 0;
    // height: 2rem;
  }
  .bg-slider-track {
    width: 100%;
    height: 4px;
    background-color: #aaa;
    .bg-slider-bar {
      height: 100%;
      background-color:rgb(238, 135, 51);
    }
  }
  .bg-slider-handle {
    $w: 1.2rem;
    $h: 1.2rem;
    border: 2px solid white;
    box-sizing: border-box;
    width: $w;
    height: $h;
    border-radius: 50%;
    background: rgb(238, 135, 51);
    margin-left: -$w/2;
    margin-top: -$h/2;
    position: absolute;
    cursor: grab;
    top: 50%;
    transition: background-color 0.2s;
    box-shadow: $shadow;
    overflow: hidden;
    &:hover {
      // This prevent transparent lighter color from showing background through
      background: white linear-gradient(rgb(197, 168, 129), rgb(135, 155, 221));
    }
  }
}


</style>