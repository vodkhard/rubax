<template>
  <main>
    <div class="top-links">
      <router-link :to="{ name: 'post-list' }">
        <vue-feather
          tag="div"
          size="36"
          type="home"
          stroke-width="1"
          stroke="#9b4dca"
        />
      </router-link>
      <router-link tag="div" :to="{name: 'post-new'}">
        <vue-feather
          tag="div"
          size="36"
          type="plus-circle"
          stroke-width="1"
          stroke="#9b4dca"
        />
      </router-link>

      <template v-if="logged === false">
        <router-link tag="button" class="button" :to="{name: 'register'}">Register</router-link>
        <router-link tag="button" class="button" :to="{name: 'login'}">Login</router-link>
      </template>
      <template v-else>
        <vue-feather
          tag="div"
          size="36"
          type="log-out"
          stroke-width="1"
          stroke="#9b4dca"
          @click="logout"
        />
      </template>
    </div>

    <router-view></router-view>
  </main>
</template>

<style scoped>
  .top-links {
    display: flex;
    margin-bottom: 15px;
  }
  .top-links > * {
    margin-right: 10px;
  }
</style>

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
