<template>
  <div>
    <router-link tag="button" class="button" :to="{ name: 'post-list' }">Go back to the list</router-link>
    <h1>{{ post.title }}</h1>
    <p>{{ post.content }}</p>
    <div>
      <code>{{ post.upvotes }}</code>
      <button @click="() => upvote(post.id)" :disabled="!can_vote">clap</button>
    </div>
    <div>
      <h3>Comments :</h3>
      <ListComment :comments="post.comments"/>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import ListComment from "@/components/comment/ListComment";

export default {
  name: "show-post",
  components: {
    ListComment
  },
  beforeMount() {
    this.getPost({ params: this.$route.params });
  },
  data() {
    return {
      can_vote: true
    };
  },
  computed: {
    ...mapState(["post"])
  },
  methods: {
    upvote(post_id) {
      this.upvotePost({ params: { post_id } });
      this.can_vote = false;
    },
    ...mapActions(["getPost", "upvotePost"])
  }
};
</script>
