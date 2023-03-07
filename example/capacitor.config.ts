import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.example.app',
  appName: 'example',
  webDir: 'dist',
  bundledWebRuntime: false,
  server: {
		url: "http://localhost:8080/",
		cleartext: true
	}
};

export default config;
