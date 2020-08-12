//
//  MenuVC+CVDelegate.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = collectionView.collectionViewLayout
                    as? UICollectionViewFlowLayout {
                           let padding:CGFloat = 20
                           layout.sectionInset = .init(top: padding,
                                                       left: padding,
                                                       bottom: padding,
                                                       right: padding)
                           layout.minimumLineSpacing = 30
           }
        return .init(width: collectionView.frame.width / 1.2, height: 150)
    }
}
extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = Titles.allCases[indexPath.row]
        switch action {
        case .countries:
            presenter.showCountriesViewController()
        case .cities:
            presenter.showCitiesViewController()
        case .airports:
            presenter.showAirportsViewController()
        }
    }
}
