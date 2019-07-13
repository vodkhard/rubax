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


<script>
import {mapActions, mapState} from "vuex";

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
      this.$router.push({ name: 'post-list', query: { category: id } });
    },
    ...mapActions(["loadCategories"])
  }
};
</script>
