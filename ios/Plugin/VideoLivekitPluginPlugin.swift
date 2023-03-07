import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(VideoLivekitPluginPlugin)
public class VideoLivekitPluginPlugin: CAPPlugin {
    private let implementation = VideoLivekitPlugin()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func launchLivekit(_ call: CAPPluginCall) {
            call.resolve()
        }
}
