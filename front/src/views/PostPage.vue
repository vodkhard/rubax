<template>
  <div>
    <router-link tag="button" class="button" :to="{name: 'post-new'}">Create new post</router-link>

    <template v-if="logged === false">
      <router-link tag="button" class="button" :to="{name: 'register'}">Register</router-link>
      <router-link tag="button" class="button" :to="{name: 'login'}">Login</router-link>
    </template>
    <template v-else>
      <button class="button" @click="logout">Logout</button>
    </template>

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "post-page",
  data() {
    return {
      logged: false
    }
  },
  mounted() {
    this.logged = window.localStorage.getItem('token') !== null
  },
  methods: {
    logout() {
      window.localStorage.removeItem('token');
      this.logged = false;
    }
  }
};
</script>
