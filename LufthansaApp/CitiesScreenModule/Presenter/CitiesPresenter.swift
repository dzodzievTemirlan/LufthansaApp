//
//  CitiesPresenter.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol CitiesViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol CitiesViewPresenterProtocol: class {
    init (
            view: CitiesViewProtocol,
            dataFetcher: NetworkRequestProtocol,
            coreDataService: CoreDataServiceProtocol,
            networkConnection: NetworkConnectionProtocol
    )
    func getCitiesFromLocal()
    func getCitiesFromNetwork()
    var cities: [CityModel]? {get set}
    var localStorageIsEmpty: Bool {get set}
   
}

class CitiesPresenter: CitiesViewPresenterProtocol {
    weak var view: CitiesViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var coreDataService: CoreDataServiceProtocol?
    var networkConnection: NetworkConnectionProtocol?
    var cities: [CityModel]?
    var localStorageIsEmpty: Bool = true
    required init(
                view: CitiesViewProtocol,
                dataFetcher: NetworkRequestProtocol,
                coreDataService: CoreDataServiceProtocol,
                networkConnection: NetworkConnectionProtocol
    ) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.coreDataService = coreDataService
        self.networkConnection = networkConnection
    }
    func getCitiesFromLocal() {
        coreDataService?.fetchDataFromCoreData(
                                            key: .cities,
                                            to: .cities,
                                            type: CitiesManagedObject.self,
                                            compelition: { (result, error) in
            DispatchQueue.main.async {
                if error == nil {
                    guard let result = result else { return }
                    if !result.isEmpty {
                        var array = [CityModel]()
                        self.localStorageIsEmpty = false
                        for city in result {
                            array.append(city.cities)
                        }
                        self.cities = array
                        self.view?.success()
                    }
                }
            }
        })
    }
    func getCitiesFromNetwork() {
        if localStorageIsEmpty {
            self.networkConnection?.checkInternetConnection(complition: { (check) in
                if check {
                    self.dataFetcher?.fetchJSONData(
                                                    request: .cities,
                                                    model: CitiesModel.self,
                                                    complition: { (result) in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let cities):
                                self.cities = cities?.cityResource.cities.city
                                self.coreDataService?.saveDataFromNetwork(
                                                                          key: .cities,
                                                                          to: .cities,
                                                                          that: self.cities!)
                                self.view?.success()
                            case .failure(let error):
                                self.view?.failure(error: error)
                            }
                        }
                    })
                }
            })
        }
    }
}
