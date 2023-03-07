import Foundation

@objc public class VideoLivekitPlugin: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    @objc public func launchLivekit(_ token: String) -> Void {
            print("Token:")
            print(token)
        }
}
