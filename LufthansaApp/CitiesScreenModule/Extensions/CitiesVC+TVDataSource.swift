//
//  CitiesVC+TVDataSource.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cities = presenter?.cities?.cityResource.cities.city else { return 0 }
        return cities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView
                        .dequeueReusableCell(
                            withIdentifier: String(
                            describing: CityCell.self),
                            for: indexPath) as? CityCell
                    else { fatalError() }
        guard let cities = presenter?.cities?.cityResource.cities.city else { return cell}
        cell.cityLabel.text = cities[indexPath.row].names.name.empty
        return cell
    }
}
