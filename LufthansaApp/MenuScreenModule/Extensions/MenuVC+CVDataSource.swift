//
//  MenuVC+CVDataSource.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

enum Titles: String, CaseIterable {
    case countries = "Countries"
    case cities = "Cities"
    case airports = "Airports"
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Titles.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(
                                                withReuseIdentifier:
                                                String(describing: MenuCell.self),
                                                for:
                                                indexPath) as? MenuCell else { fatalError() }
        cell.titleLabel.text = Titles.allCases[indexPath.row].rawValue
        return cell
    }
}
