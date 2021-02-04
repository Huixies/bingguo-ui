<template>
  <button 
    class="bg-button" 
    :class="classes" 
    :disabled="disabled">
    <span 
      v-if="loading" 
      class="bg-loadingIndicator"></span>
    <slot />
  </button>
</template>

<script lang="ts" setup="props">
import { computed } from "vue";
declare const props: {
  theme?: 'button' | 'text' | 'link';
  size?: 'normal' | 'big' | 'small';
  level?: 'normal' | 'main' | 'danger';
  disabled: boolean;
  loading: boolean;
}
export default {
  props: {
    theme: {
      type: String,
      default: "button", 
    },
    size: {
      type: String,
      default: "normal",
    },
    level: {
      type: String,
      default: "normal",
    },
    disabled: {
      type: Boolean,
      defalut: false,
    },
    loading: {
      type: Boolean,
      default: false,
    },
  },
}
const { theme, size, level } = props;
export  const classes = computed(() => {
  return {
      [`bg-theme-${theme}`]: theme,
      [`bg-size-${size}`]: size,
      [`bg-level-${level}`]: level,
    };
})

</script>

<style lang="scss">
$h: 32px;
$border-color: #d9d9d9;
$color: #333;
$orange:rgb(238, 135, 51);
$radius: 4px;
$red: red;
$grey: grey;
.bg-button {
  box-sizing: border-box;
  height: $h;
  padding: 0 12px;
  cursor: pointer;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  white-space: nowrap;
  background: white;
  color: $color;
  border: 1px solid $border-color;
  border-radius: $radius;
  box-shadow: 0 1px 0 fade-out(black, 0.95);
  transition: background 250ms;
  & + & {
    margin-left: 8px;
  }
  &:hover,
  &:focus {
    color:$orange;
    border-color: $orange;
  }
  &:focus {
    outline: none;
  }
  &::-moz-focus-inner {
    border: 0;
  }
  &.bg-theme-link {
    border-color: transparent;
    box-shadow: none;
    color: $orange;
    &:hover,
    &:focus {
      color: lighten($orange, 10%);
    }
  }
  &.bg-theme-text {
    border-color: transparent;
    box-shadow: none;
    color: inherit;
    &:hover,
    &:focus {
      background: darken(white, 5%);
    }
  }
  &.bg-size-big {
    font-size: 24px;
    height: 48px;
    padding: 0 16px;
  }
  &.bg-size-small {
    font-size: 12px;
    height: 20px;
    padding: 0 6px;
  }
  &.bg-theme-button {
      margin: 10px 14px;
    &.bg-level-main {
      background: $orange;
      color: white;
      border-color: $orange;
      
      &:hover,
      &:focus {
        background: darken($orange, 10%);
        border-color: darken($orange, 10%);
      }
    }
    &.bg-level-danger {
      background: $red;
      border-color: $red;
      color: white;
      &:hover,
      &:focus {
        background: darken($red, 10%);
        border-color: darken($red, 10%);
      }
    }
  }
  &.bg-theme-link {
    &.bg-level-danger {
      color: $red;
      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
  }
  &.bg-theme-text {
    &.bg-level-main {
      color: $orange;
      &:hover,
      &:focus {
        color: darken($orange, 10%);
      }
    }
    &.bg-level-danger {
      color: $red;
      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
  }
  &.bg-theme-button {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;
      &:hover {
        border-color: $grey;
      }
    }
  }
  &.bg-theme-link,
  &.bg-theme-text {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;
    }
  }
  > .bg-loadingIndicator {
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-right: 4px;
    border-radius: 8px;
    border-color: $orange $orange $orange transparent;
    border-style: solid;
    border-width: 2px;
    animation: bg-spin 1s infinite linear;
  }
}
@keyframes bg-spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
