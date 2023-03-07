export interface VideoLivekitPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  launchLivekit(options: { token: string }): Promise<void>;
}
