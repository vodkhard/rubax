<template>
  <form>
    <label for="title">Title</label>
    <input placeholder="Title" id="title" v-model="form.title" />

    <label for="content">Content</label>
    <textarea placeholder="Content" id="content" v-model="form.content" :rows="5"></textarea>

    <button type="submit" class="button" @click="onSubmit">Create</button>
  </form>
</template>

<script>
// @ is an alias to /src
import { mapState, mapActions } from "vuex";

export default {
  name: "form-post",
  data() {
    return {
      form: {
        title: "",
        content: "",
        user_id: 1
      }
    };
  },
  computed: {
    ...mapState(["post"])
  },
  methods: {
    onSubmit() {
      this.createPost({ data: this.form });
    },
    ...mapActions(["createPost"])
  }
};
</script>
