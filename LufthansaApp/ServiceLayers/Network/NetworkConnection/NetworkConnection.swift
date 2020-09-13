//
//  NetworkConnection.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 17.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
import Network

protocol NetworkConnectionProtocol {
  func checkInternetConnection(complition: @escaping(Bool) -> Void)
}

class NetworkConnection: NetworkConnectionProtocol {
  var test: Bool?
  func checkInternetConnection(complition: @escaping(Bool) -> Void) {
    let monitor = NWPathMonitor()
    monitor.pathUpdateHandler = { path in
        DispatchQueue.main.async {
          if path.status == .satisfied {
            complition(true)
            print(true)
          } else {
            complition(false)
            print(false)
          }
        }
    }
    let queue = DispatchQueue(label: "Network")
    monitor.start(queue: queue)
  }
}
