<template>
  <form @submit="onSubmit">
    <label for="title">Title</label>
    <input placeholder="Title" id="title" v-model="form.title">

    <label for="type">Post Type</label>
    <select name="type" id="type" v-model="form.type">
      <option value="content">Content</option>
      <option value="link">Link</option>
    </select>

    <template v-if="form.type === 'content'">
      <label>Content</label>
      <textarea placeholder="Content" v-model="form.content" :rows="5"></textarea>
    </template>
    <template v-else>
      <label>Link</label>
      <input type="url" v-model="form.content">
    </template>

    <label for="category">Category</label>
    <select name="category" id="category" v-model="form.category_id">
      <option v-for="category in categories" :value="category.id">{{ category.label }}</option>
    </select>

    <button type="submit" class="button" >Create</button>
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
        type: "content",
        user_id: 1,
        category_id: null,
      }
    };
  },
  computed: {
    ...mapState(["post", "categories"])
  },
  mounted() {
    this.loadCategories();
  },
  methods: {
    onSubmit(e) {
      e.preventDefault();
      this.createPost({ data: this.form }).then(res => {
        if (res.status === 201) {
          this.$router.push('/')
        }
      });
    },
    ...mapActions(["createPost", "loadCategories"])
  }
};
</script>
