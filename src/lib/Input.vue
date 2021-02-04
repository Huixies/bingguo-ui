<template>
  <div class="wrapper" :class="{ error: error }">
    <input
      :value="value || value == '' ? value : modelValue"
      type="text"
      :disabled="disabled"
      :readonly="readonly"
      :placeholder="placeholder"
      @change="inputval"
      @input="inputval"
      @focus="inputBlur"
      @blur="inputBlur"
    />
    <template v-if="error">
      <span class="errorMessage">{{ error }}</span>
    </template>
  </div>
</template>

<script lang="ts" setup="props, context">
import { SetupContext } from 'vue';
declare const context: SetupContext
export default {
  props: {
    value: {
      type: String,
      default: "",
    },
    modelValue: {
      type: String,
      default: "",
    },
    disabled: {
      type: Boolean,
      default: false,
    },
    readonly: {
      type: Boolean,
      default: false,
    },
    error: {
      type: String,
    },
    placeholder:{
      type: String,
    }
  }
}
    export const inputval = (e: KeyboardEvent) => {
      context.emit("update:value", (e.target as HTMLInputElement).value);
    };
    export const inputBlur = (e: FocusEvent) => {
      context.emit("update:modelValue", (e.target as HTMLInputElement).value);
    };
 
</script>

<style lang="scss" scoped>
$height: 32px;
$border-color: #999;
$border-color-hover: #666;
$red: #f1453d;
.wrapper {
  display: inline-flex;
  align-items: center;
  font-size: 12px;
  > :not(:last-child) {
    margin-right: 0.5em;
  }
  &.error {
    > input {
      border-color: $red;
      &:hover {
        border-color: $red;
        &[disabled],
        &[readonly] {
          border-color: #ccc;
        }
      }
    }
    .errorMessage {
      color: red;
    }
  }
  > input {
    height: $height;
    border: 1px solid $border-color;
    border-radius: 4px;
    padding: 0 8px;
    outline: none;
    margin: 0.5em 0.5em;
    &:hover {
      border-color: $border-color-hover;
    }
    &:focus {
      box-shadow: inset 0 1px 3px rgba(#ccc, 0.8);
    }
    &[disabled],
    &[readonly] {
      border-color: #ccc;
      color: #ccc;
      cursor: not-allowed;
    }
  }
}
</style>
