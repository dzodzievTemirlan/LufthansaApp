//
//  MenuCell.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 1, alpha: 1)
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.5647058824, blue: 0.4784313725, alpha: 1)
        contentView.layer.cornerRadius = 10
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
