//
//  MenuPresenter.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol MenuViewPresenterProtocol {
    init(view: UIViewController, router: RouterProtocol)
    func showCountriesViewController()
    func showCitiesViewController()
    func showAirportsViewController()
}

class MenuPresenter: MenuViewPresenterProtocol {
    weak var view: UIViewController?
    var router: RouterProtocol?
    required init(view: UIViewController, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    func showCountriesViewController() {
        router?.showCountriesViewController()
    }
    func showCitiesViewController() {
        router?.showCititesViewController()
    }
    func showAirportsViewController() {
        router?.showAirportsViewController()
    }
    
}
