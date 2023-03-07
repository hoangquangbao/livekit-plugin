import { registerPlugin } from '@capacitor/core';

import type { VideoLivekitPluginPlugin } from './definitions';

const VideoLivekitPlugin = registerPlugin<VideoLivekitPluginPlugin>(
  'VideoLivekitPlugin',
  {
    web: () => import('./web').then(m => new m.VideoLivekitPluginWeb()),
  },
);

export * from './definitions';
export { VideoLivekitPlugin };
