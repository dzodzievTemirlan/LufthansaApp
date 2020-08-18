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
    func createAirportsViewController(router: Router) -> UIViewController
    func createMapViewController() -> UIViewController
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
        let coreDataService = CoreDataService()
        let networkConnection = NetworkConnection()
        let presenter = CountriesPresenter(
                                            view: view,
                                            dataFetcher: dataFetcher,
                                            coreDataService: coreDataService,
                                            networkConnection: networkConnection)
        view.presenter = presenter
        return view
    }
    func createCitiesViewController() -> UIViewController {
        let view = CitiesViewController()
        let dataFetcher = NetworkRequest()
        let coreDataService = CoreDataService()
        let networkConnection = NetworkConnection()
        let presenter = CitiesPresenter(
                                        view: view,
                                        dataFetcher: dataFetcher,
                                        coreDataService: coreDataService,
                                        networkConnection: networkConnection)
        view.presenter = presenter
        return view
    }
    func createAirportsViewController(router: Router) -> UIViewController {
        let view = AirportsViewController()
        let dataFetcher = NetworkRequest()
        let coreDataService = CoreDataService()
        let networkConnection = NetworkConnection()
        let presenter = AirportsPresenter(
                                            view: view,
                                            dataFetcher: dataFetcher,
                                            router: router,
                                            coreDataService: coreDataService,
                                            networkConnection: networkConnection)
        view.presenter = presenter
        return view
    }
    func createMapViewController() -> UIViewController {
        let view = MapViewController()
        let dataFetcher = NetworkRequest()
        let presenter = MapPresenter(view: view, dataFetcher: dataFetcher)
        view.presenter = presenter
        return view
    }
}
