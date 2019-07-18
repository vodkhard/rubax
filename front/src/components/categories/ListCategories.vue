<template>
  <div>
    Categories :
    <div>
      <button
        v-for="category in categories"
        :class="getButtonClass(category)"
        @click="filterCategory(category.id)"
      >{{ category.label }}</button>
    </div>
  </div>
</template>

<style scoped>
  button {
    font-size: 10px;
    padding: 0 1rem;
    margin-right: 5px;
  }
</style>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "list-categories",
  beforeMount() {
    this.loadCategories();
  },
  computed: {
    ...mapState(["categories"])
  },
  methods: {
    getButtonClass(category) {
      return {
        'button': true,
        'button-outline': category.id === +this.$route.query.category
      }
    },
    filterCategory(id) {
      if (id === +this.$route.query.category) {
        this.$router.push({ name: 'post-list' });
      } else {
        this.$router.push({ name: 'post-list', query: { category: id } });
      }
    },
    ...mapActions(["loadCategories"])
  }
};
</script>
