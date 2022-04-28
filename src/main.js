import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify'
import VueSwal from 'vue-swal'

Vue.config.productionTip = false
Vue.prototype.$showNaVBarLogin = true;
Vue.use(VueSwal)

new Vue({
  router,
  vuetify,
  render: h => h(App)
}).$mount('#app')
