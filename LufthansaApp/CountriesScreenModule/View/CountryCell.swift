//
//  CountryCell.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    let countryLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = .systemFont(ofSize: 18, weight: .medium)
           return label
       }()
       override func layoutSubviews() {
           super.layoutSubviews()
           addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       }
}
