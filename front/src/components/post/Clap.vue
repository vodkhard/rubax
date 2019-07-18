<template>
  <div class="clap">
    <vue-feather
      tag="div"
      type="thumbs-up"
      stroke-width="1"
      :stroke="can_vote ? 'currentColor' : '#9b4dca'"
      size="29"
      @click="upvote"
      :disabled="!can_vote"
    />
    <div class="upvote" :style="{color: can_vote ? 'none' : '#9b4dca'}">
      <span>{{ post.upvotes }}</span>
    </div>
  </div>
</template>

<style scoped>
  .feather {
    margin-right: 5px;
  }
  .upvote {
    font-size: 16px;
    margin-top: 5px;
  }
  .clap {
    display: flex;
    align-items: center;
  }
</style>

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