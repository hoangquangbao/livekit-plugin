<template>
  <div id="app">
    <div style="margin-top: 10rem"></div>
    <div>
      Token:
      <textarea v-model="token"></textarea>
    </div>
    <hr />
    <button @click="fetchToken" style="margin-right: 10px">Fetch Token</button>
    <button @click="launchLiveKit">Launch LiveKit</button>
  </div>
</template>