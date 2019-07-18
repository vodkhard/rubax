<template>
  <div id="app" class="container">
    <div class="row">
      <div class="column column-50 column-offset-25">
        <img class="logo" src="./assets/logo.png" alt="logo">
        <router-view/>
      </div>
    </div>
  </div>
</template>

<style>
  html, body {
    font-size: 12px!important;
  }
  .logo {
    position: fixed;
    top: 20px;
    left: 20px;
  }
  .feather {
    cursor: pointer;
  }
</style>
