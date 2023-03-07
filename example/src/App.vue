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

<script setup>
import { onMounted, ref } from 'vue';
import { VideoLivekitPlugin } from 'livekit-plugin';

const token = ref('');

const fetchToken = async () => {
  let response = await fetch('https://livekit-demo.pt-infra.net/demo?name=bao', {
    body: null,
    method: 'GET',
  });

  token.value = await response.text();
};

const launchLiveKit = async () => {
  await VideoLivekitPlugin.launchLivekit({ token: token.value });
};

onMounted(() => {
  console.info('START');
});
</script>