//
//  CitiesVC+CitiesViewProtocol.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 14.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

extension CitiesViewController: CitiesViewProtocol {
    func success() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error)
    }
}
