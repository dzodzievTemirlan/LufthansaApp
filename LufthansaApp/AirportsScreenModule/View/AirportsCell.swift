//
//  AirportsCell.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class AirportsCell: UITableViewCell {
  
  let airportLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 18, weight: .medium)
    return label
  }()
  
  let cityCodeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 15, weight: .regular)
    return label
  }()
  
  let countryCodeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 15, weight: .regular)
    return label
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    addSubview(airportLabel)
    airportLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    airportLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    addSubview(cityCodeLabel)
    cityCodeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    cityCodeLabel.topAnchor.constraint(equalTo: airportLabel.bottomAnchor, constant: 5).isActive = true
    addSubview(countryCodeLabel)
    countryCodeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    countryCodeLabel.topAnchor.constraint(equalTo: cityCodeLabel.bottomAnchor, constant: 5).isActive = true
  }
}
