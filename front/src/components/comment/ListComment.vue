<template>
  <div>
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

export default {
  name: "list-comment",
  props: ["comments"],
  methods: {
    formatDate(date) {
      return dayjs(date).format("DD/MM/YYYY");
    }
  }
};
</script>

<style scoped>
</style>