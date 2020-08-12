//
//  AirportsVC+TVDataSource.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension AirportsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         guard let airports = presenter?.airports?.airportsResource.airports.airport else { return 0}
        return airports.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView
                            .dequeueReusableCell(
                                withIdentifier:
                                String(describing: AirportsCell.self),
                                for: indexPath) as? AirportsCell
                        else { fatalError() }
        guard let airports = presenter?.airports?.airportsResource.airports.airport else { return cell }
        cell.airportLabel.text = airports[indexPath.row].names.name.empty
        cell.cityCodeLabel.text = airports[indexPath.row].cityCode
        cell.countryCodeLabel.text = airports[indexPath.row].countryCode
        return cell
    }
}
