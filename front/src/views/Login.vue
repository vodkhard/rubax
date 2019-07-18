<template>
  <div>
    <h1>Login</h1>
    <p v-if="$route.query.redirect">You need to login first.</p>
    <form @submit.prevent="onSubmit">
      <label>
        Email
        <input v-model="email" placeholder="email" type="text">
      </label>
      <label>
        Password
        <input v-model="password" placeholder="password" type="password">
      </label>
      <button type="submit">login</button>
      <p v-if="error" class="error">Bad login information</p>
    </form>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "login",
  data() {
    return {
      email: "admin@test.com",
      password: "azertyuiop",
      error: false
    };
  },
  computed: {
    ...mapState(["token"])
  },
  mounted() {
    if (localStorage.getItem('token')) {
      this.$router.push('/');
    }
  },
  methods: {
    onSubmit() {
      this.login({
        data: { auth: { email: this.email, password: this.password } }
      }).then(() => {
        this.$router.push('/');
      });
    },
    ...mapActions(["login"])
  }
};
</script>
