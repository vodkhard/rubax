import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "homepage",
      component: () => import("./views/PostPage.vue"),
      children: [
        {
          path: "",
          name: "post-list",
          component: () => import("./components/post/ListPost")
        }
      ]
    },
    {
      path: "/posts",
      name: "post-page",
      component: () => import("./views/PostPage.vue"),
      children: [
        {
          path: "new",
          name: "post-new",
          component: () => import("./components/post/FormPost.vue")
        },
        {
          path: ":id",
          name: "post-show",
          component: () => import("./components/post/ShowPost.vue")
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
      component: () =>
        import("./views/About.vue")
    }
  ]
});
