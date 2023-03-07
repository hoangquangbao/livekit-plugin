import { WebPlugin } from '@capacitor/core';

import type { VideoLivekitPluginPlugin } from './definitions';

export class VideoLivekitPluginWeb
  extends WebPlugin
  implements VideoLivekitPluginPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
