//
//  CityCell.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(cityLabel)
        cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
