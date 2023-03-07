export interface VideoLivekitPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
