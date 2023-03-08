//
//  RoomViewController.swift
//  Plugin
//
//  Created by Quang Bao on 08/03/2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import UIKit
import LiveKitClient
import SwiftUI

@available(iOS 14.0, *)
class RoomViewController: UIViewController {
    
    var url: String = ""
    var token: String = ""
    
    var hostview: UIHostingController<RoomContextView>!
    var viewModel: RoomViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RoomViewModel(url: url, token: token)
        hostview = UIHostingController(rootView: RoomContextView(viewModel: viewModel))

        addChild(hostview)
        view.addSubview(hostview.view)
        hostview.didMove(toParent: self)
        hostview.view.frame = self.view.bounds
    }
}
