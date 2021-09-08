//
//  NetworkStatus.swift
//  Created by Brenner on 06/09/21.
//  Copyright © 2021 Brenner. All rights reserved.
//

import Alamofire
import Foundation

class NetworkStatus {
    static let shared = NetworkStatus()
    
    var networkManager: NetworkReachabilityManager?
    
    init() {
        self.networkManager = NetworkReachabilityManager()
    }
    
    func isInternetAvailable() -> Bool {
        guard let manager = self.networkManager else { return false }
        return manager.isReachable
    }
}

