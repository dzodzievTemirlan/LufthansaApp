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
    init (
            view: AirportsViewProtocol,
            dataFetcher: NetworkRequestProtocol,
            router: RouterProtocol,
            coreDataService: CoreDataServiceProtocol,
            networkConnection: NetworkConnectionProtocol
    )
    func getAirportsFromLocal()
    func getAirportsFromNetwork()
    func showMap()
    var airports: [AirportModel]? {get set}
    var empty: Bool {get set}
}
class AirportsPresenter: AirportsViewPresenterProtocol {
    weak var view: AirportsViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var router: RouterProtocol?
    var coreDataService: CoreDataServiceProtocol?
    var networkConnection: NetworkConnectionProtocol?
    var airports: [AirportModel]?
    var empty: Bool = true
    required init(
                    view: AirportsViewProtocol,
                    dataFetcher: NetworkRequestProtocol,
                    router: RouterProtocol,
                    coreDataService: CoreDataServiceProtocol,
                    networkConnection: NetworkConnectionProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.router = router
        self.networkConnection = networkConnection
        self.coreDataService = coreDataService
    }
    func getAirportsFromLocal() {
        coreDataService?.fetchDataFromCoreData(
                                                key: .airports,
                                                to: .airports,
                                                type: AirportsManagedObject.self,
                                                compilition: { (result, error) in
            if error == nil {
                guard let result = result else { return }
                if !result.isEmpty {
                    var array = [AirportModel]()
                    self.empty = false
                    for airport in result {
                        array.append(airport.airports)
                    }
                    self.airports = array
                    self.view?.success()
                }
            }
        })
    }
    func getAirportsFromNetwork() {
        if empty {
            self.networkConnection?.checkInternetConnection(complition: { (check) in
                if check {
                    self.dataFetcher?.fetchJSONData(
                                                    request: .airports,
                                                    model: AirportsModel.self,
                                                    complition: { (result) in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let airports):
                                self.airports = airports?.airportsResource.airports.airport
                                self.view?.success()
                                self.coreDataService?.saveDataFromNetwork(
                                                                            key: .airports,
                                                                            to: .airports,
                                                                            that: self.airports!)
                            case .failure(let error):
                                self.view?.failure(error: error)
                            }
                        }
                    })
                }
            })
        }
    }
    func showMap() {
        router?.showMapViewController()
      }
}
