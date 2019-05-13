<template>
  <div v-infinite-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="5">
    <div v-for="post in posts">
      <router-link tag="h3" :to="{name: 'post-show', params: { id: post.id }}">
        <code>{{ post.id }}</code> {{ post.title }}
      </router-link>
      <code>{{ post.category.label }}</code>
      <code>{{ post.upvotes }}</code>
      <hr>
    </div>
  </div>
</template>

<script>
import infiniteScroll from 'vue-infinite-scroll';
import { mapState, mapActions } from "vuex";

export default {
  name: "list-post",
  directives: {
    infiniteScroll
  },
  beforeMount() {
    if (this.posts.length === 0) {
      this.loadPosts({ params: { page: 1 } });
    }
  },
  data() {
    return {
      page: 1,
      busy: false
    }
  },
  computed: {
    ...mapState(["posts"])
  },
  methods: {
    loadMore() {
      if (this.posts.length > 0) {
        this.page += 1;
        this.loadPosts({ params: { page: this.page } });
      }
    },
    ...mapActions(["loadPosts"])
  }
};
</script>
