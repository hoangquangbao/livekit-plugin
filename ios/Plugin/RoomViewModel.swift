//
//  RoomViewModel.swift
//  Plugin
//
//  Created by Quang Bao on 08/03/2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import SwiftUI

class RoomViewModel: ObservableObject {
    
    var url: String
    var token: String
    
    init(url: String, token: String) {
        self.url = url
        self.token = token
    }
}
