import Vue from "vue";
import VueFeather from "vue-feather";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import 'milligram/dist/milligram.min.css';

Vue.config.productionTip = false;
Vue.component('vue-feather', VueFeather);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
