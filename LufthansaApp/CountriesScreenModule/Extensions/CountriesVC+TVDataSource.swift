//
//  CountriesVC+TVDataSource.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let countries = presenter?
                                .coutries?
                                .countryResourse
                                .countries
                                .country
                            else { return 0 }
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: String(describing: CountryCell.self),
                            for: indexPath ) as? CountryCell else { fatalError() }
        guard
            let countries = presenter?
                                .coutries?
                                .countryResourse
                                .countries
                                .country
                            else { return cell }
        cell.countryLabel.text = countries[indexPath.row].names.name.empty
        return cell
    }
}
