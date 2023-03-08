import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@available(iOS 14.0, *)
@objc(VideoLivekitPluginPlugin)
public class VideoLivekitPluginPlugin: CAPPlugin {
    private let implementation = VideoLivekitPlugin()
    
    private var roomViewController: RoomViewController?

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func launchLivekit(_ call: CAPPluginCall) {

        let token = call.getString("token") ?? ""

        DispatchQueue.main.async {

            guard let bridge = self.bridge else { return }
            if self.roomViewController == nil {
                self.roomViewController = RoomViewController()
                //Replace "xxx" by your token
                self.roomViewController?.token = "xxx"
                self.roomViewController?.url = "wss://livekit.pt-infra.net/"

                self.roomViewController?.modalPresentationStyle = .fullScreen
                bridge.viewController?.present(self.roomViewController!, animated: true)
            }
        }
        call.resolve()
    }
}
