<template>
  <div>
    <textarea v-model="comment" placeholder="What do you think about this post ?"></textarea>
    <button v-on:click="addComment" class="button">Comment !</button>
    <div v-for="comment in comments" :key="`comment-${comment.id}`">
      <small>{{ comment.name }}</small>
      <p>{{ comment.message }}</p>
      <small>{{ formatDate(comment.created_at) }}</small>
      <hr>
    </div>
  </div>
</template>

<script>
import dayjs from "dayjs";
import { mapActions } from "vuex";

export default {
  name: "list-comment",
  props: ["comments", "post_id"],
  data() {
    return {
      comment: ''
    }
  },
  methods: {
    formatDate(date) {
      return dayjs(date).format("DD/MM/YYYY");
    },
    addComment() {
      this.postComment({ params: { post_id: this.post_id }, data: {message: this.comment} });
    },
    ...mapActions(["postComment"])
  }
};
</script>

<style scoped>
</style>