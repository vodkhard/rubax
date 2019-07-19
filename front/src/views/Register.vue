<template>
  <div>
    <h1>Register</h1>
    <form @submit.prevent="onSubmit">
      <label>
        Email
        <input v-model="email" placeholder="email" type="email">
      </label>
      <label>
        Username
        <input v-model="username" placeholder="username" type="text">
      </label>
      <label>
        Password
        <input v-model="password" placeholder="password" type="password">
      </label>
      <label>
        Password confirmation
        <input v-model="password_confirmation" placeholder="confirm your password" type="password">
      </label>
      <button type="submit">register</button>
    </form>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "register",
  data() {
    return {
      email: "hugo1@test.com",
      username: "hugo1",
      password: "azerty",
      password_confirmation: "azerty",
      error: false
    };
  },
  mounted() {
    if (localStorage.getItem('token')) {
      this.$router.push('/');
    }
  },
  methods: {
    onSubmit() {
      this.register({
        data: {
          email: this.email,
          username: this.username,
          password: this.password,
          password_confirmation: this.password_confirmation
        }
      }).then((res) => {
        if (res.status === 201) {
          this.login({
            data: { auth: { email: this.email, password: this.password } }
          }).then(() => {
            this.$router.push('/');
          });
        }
      });
    },
    ...mapActions(["register", "login"])
  }
};
</script>
