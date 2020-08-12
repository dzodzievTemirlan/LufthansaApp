//
//  Builder.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    func createInitialViewController(router: Router) -> UIViewController
    func createCountriesViewController() -> UIViewController
    func createCitiesViewController() -> UIViewController
    func createAirportsViewController() -> UIViewController
}

class Builder: BuilderProtocol {
    func createInitialViewController(router: Router) -> UIViewController {
        let view = MenuViewController()
        let presenter = MenuPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createCountriesViewController() -> UIViewController {
        let view = CountriesViewController()
        let dataFetcher = NetworkRequest()
        let presenter = CountriesPresenter(view: view, dataFetcher: dataFetcher )
        view.presenter = presenter
        return view
    }
    func createCitiesViewController() -> UIViewController {
        let view = CitiesViewController()
        let dataFetcher = NetworkRequest()
        let presenter = CitiesPresenter(view: view, dataFetcher: dataFetcher)
        view.presenter = presenter
        return view
    }
    func createAirportsViewController() -> UIViewController {
        let view = AirportsViewController()
        let dataFetcher = NetworkRequest()
        let presenter = AirportsPresenter(view: view, dataFetcher: dataFetcher)
        view.presenter = presenter
        return view
    }
}
