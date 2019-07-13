<template>
  <div>
    <ListCategories />
    <div v-infinite-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="5">
      <div v-for="post in posts" :key="`post-${post.id}`">
        <a v-if="post.post_type === 'link'" :href="post.content" target="_blank">
          <h3>
            <small>link</small>
            <code>{{ post.id }}</code>
            {{ post.title }}
          </h3>
        </a>
        <router-link v-else tag="h3" :to="{name: 'post-show', params: { id: post.id }}">
          <code>{{ post.id }}</code>
          {{ post.title }}
        </router-link>
        <code>{{ post.category.label }}</code>
        <code>{{ post.upvotes }}</code>
        <Clap :post="post"></Clap>
        <hr>
      </div>
    </div>
  </div>
</template>

<style>
  a {
    color: inherit !important;
  }
  h3 {
    cursor: pointer;
  }
</style>

<script>
import infiniteScroll from "vue-infinite-scroll";
import { mapState, mapActions } from "vuex";
import Clap from "@/components/post/Clap";
import ListCategories from "@/components/categories/ListCategories";

export default {
  name: "list-post",
  components: {
    Clap,
    ListCategories
  },
  directives: {
    infiniteScroll
  },
  beforeMount() {
    if (this.posts.length === 0) {
      this.getPosts()
    }
  },
  data() {
    return {
      page: 1,
      busy: false
    };
  },
  computed: {
    ...mapState(["posts"])
  },
  methods: {
    getPosts(replace = false) {
      if (replace) {
        this.loadPosts({ params: { page: this.page, category: this.$route.query.category } });
      } else {
        this.loadMorePosts({ params: { page: this.page, category: this.$route.query.category } });
      }
    },
    loadMore() {
      if (this.posts.length > 0) {
        this.page += 1;
        this.getPosts();
      }
    },
    ...mapActions(["loadMorePosts", "loadPosts"])
  },
  watch:{
    $route (){
      this.getPosts(true);
    }
  }
};
</script>
