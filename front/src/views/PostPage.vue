<template>
  <div>
    <router-link tag="button" class="button" :to="{name: 'post-new'}">Create new post</router-link>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "post-page"
};
</script>
