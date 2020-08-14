//
//  AirportsPresenter.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol AirportsViewProtocol: class {
    func success()
    func failure(error: Error)
}
protocol AirportsViewPresenterProtocol {
    init (view: AirportsViewProtocol, dataFetcher: NetworkRequestProtocol, router: RouterProtocol)
    func getAirports()
    func showMap()
    var airports: [AirportModel]? {get set}
}
class AirportsPresenter: AirportsViewPresenterProtocol {
    weak var view: AirportsViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var airports: [AirportModel]?
    var router: RouterProtocol?
    required init(view: AirportsViewProtocol, dataFetcher: NetworkRequestProtocol, router: RouterProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.router = router
        getAirports()
    }
    func getAirports() {
        dataFetcher?.fetchJSONData(
                            request: .airports,
                            model: AirportsModel.self,
                            complition: { (result) in
            DispatchQueue.main.async {
                    switch result {
                    case .success(let airports):
                        self.airports = airports?.airportsResource.airports.airport
                        self.view?.success()
                    case .failure(let error):
                        self.view?.failure(error: error)
                    }
            }
        })
    }
    func showMap() {
        router?.showMapViewController()
      }
}
