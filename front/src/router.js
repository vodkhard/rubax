import Vue from "vue";
import Router from "vue-router";
import PostPage from "@/views/PostPage.vue";
import FormPost from "@/components/post/FormPost.vue";
import ShowPost from "./components/post/ShowPost";
import ListPost from "./components/post/ListPost";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "homepage",
      component: PostPage,
      children: [
        {
          path: "",
          name: "post-list",
          component: ListPost
        }
      ]
    },
    {
      path: "/posts",
      name: "post-page",
      component: PostPage,
      children: [
        {
          path: "new",
          name: "post-new",
          component: FormPost
        },
        {
          path: ":id",
          name: "post-show",
          component: ShowPost
        }
      ]
    },
    {
      path: "/login",
      name: "login",
      component: () => import("./views/Login.vue")
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    }
  ]
});
