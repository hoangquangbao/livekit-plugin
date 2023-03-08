//
//  RoomContextView.swift
//  Plugin
//
//  Created by Quang Bao on 08/03/2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import SwiftUI
import KeychainAccess

let sync = ValueStore<Preferences>(store: Keychain(service: "io.livekit.example.SwiftSDK.1"),
                                   key: "preferences",
                                   default: Preferences())

@available(iOS 14.0, *)
struct RoomContextView: View {
    
    @StateObject var viewModel: RoomViewModel
    @StateObject var appCtx = AppContext(store: sync)
    @StateObject var roomCtx = RoomContext(store: sync)
    
    var shouldShowRoomView: Bool {
        roomCtx.room.room.connectionState.isConnected || roomCtx.room.room.connectionState.isReconnecting
    }
    
    func computeTitle() -> String {
        if shouldShowRoomView {
            let elements = [roomCtx.room.room.name,
                            roomCtx.room.room.localParticipant?.name,
                            roomCtx.room.room.localParticipant?.identity]
            return elements.compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: " ")
        }

        return "LiveKit"
    }
    
    init(viewModel: RoomViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            if shouldShowRoomView {
                RoomView()
            } else {
                ProgressView()
            }
        }
        .environment(\.colorScheme, .dark)
        .foregroundColor(Color.white)
        .environmentObject(appCtx)
        .environmentObject(roomCtx)
        .environmentObject(roomCtx.room)
        .onAppear(perform: {
            roomCtx.url = viewModel.url
            roomCtx.token = viewModel.token
            
            Task {
                let room = try await roomCtx.connect()
                appCtx.connectionHistory.update(room: room)
            }
        })
        .onDisappear {
            print("\(String(describing: type(of: self))) onDisappear")
            Task {
                try await roomCtx.disconnect()
            }
        }
        .onOpenURL(perform: { url in

            guard let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
            guard let host = url.host else { return }

            let secureValue = urlComponent.queryItems?.first(where: { $0.name == "secure" })?.value?.lowercased()
            let secure = ["true", "1"].contains { $0 == secureValue }

            let tokenValue = urlComponent.queryItems?.first(where: { $0.name == "token" })?.value ?? ""

            var builder = URLComponents()
            builder.scheme = secure ? "wss" : "ws"
            builder.host = host
            builder.port = url.port

            guard let builtUrl = builder.url?.absoluteString else { return }

            print("built URL: \(builtUrl), token: \(tokenValue)")

            Task { @MainActor in
                roomCtx.url = builtUrl
                roomCtx.token = tokenValue
                if !roomCtx.token.isEmpty {
                    let room = try await roomCtx.connect()
                    appCtx.connectionHistory.update(room: room)
                }
            }
        })
    }
}

//@available(iOS 14.0, *)
//struct RoomContextView_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        RoomContextView(viewModel: <#RoomViewModel#>)
//    }
//}
