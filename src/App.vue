<template>
  <v-app>
    <div class="background"></div>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>
<style>
  .background {
    background-image: url(https://cdn.wallpapersafari.com/2/99/h3kqmP.jpg) !important;
    height: 300px;
    width: 100%;
    display: block;
    top: 0;
    position: absolute;
    background-size: cover;
}
</style>
