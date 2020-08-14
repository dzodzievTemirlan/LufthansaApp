//
//  AirportsVC+AirportsViewProtocol.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 14.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

extension AirportsViewController: AirportsViewProtocol {
    func success() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error)
    }
}
