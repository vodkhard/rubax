<template>
  <div>
    <code>{{ post.upvotes }}</code>
    <button @click="() => upvote()" :disabled="!can_vote">clap</button>
  </div>
</template>

<script>
  import { mapActions } from "vuex";

  export default {
    name: "clap-post",
    props: ["post"],
    data() {
      return {
        can_vote: true
      };
    },
    methods: {
      upvote() {
        this.upvotePost({ params: { post_id: this.post.id } });
        this.can_vote = false;
      },
      ...mapActions(["upvotePost"])
    }
  }
</script>

<style scoped>

</style>