//
//  CountriesPresenter.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol CountriesViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol CountriesViewPresenterProtocol {
    init(
        view: CountriesViewProtocol,
        dataFetcher: NetworkRequestProtocol,
        coreDataService: CoreDataServiceProtocol,
        networkConnection: NetworkConnectionProtocol
    )
    func getCountriesFromLocal()
    func getCountriesFromNetwork()
    var coutries: [Country]? {get set}
    var empty: Bool {get set}
}

class CountriesPresenter: CountriesViewPresenterProtocol {
    weak var view: CountriesViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var coreDataService: CoreDataServiceProtocol?
    var networkConnection: NetworkConnectionProtocol?
    var coutries: [Country]?
    var empty: Bool = true
    required init(
        view: CountriesViewProtocol,
        dataFetcher: NetworkRequestProtocol,
        coreDataService: CoreDataServiceProtocol,
        networkConnection: NetworkConnectionProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.coreDataService = coreDataService
        self.networkConnection = networkConnection
    }
    func getCountriesFromLocal() {
        coreDataService?.fetchDataFromCoreData(
                                            key: .country,
                                            to: .countries,
                                            type: CountryManagedObject.self,
                                            compilition: { (result, error) in
                DispatchQueue.main.async {
                    if error == nil {
                        guard let result = result  else { return }
                        if !result.isEmpty {
                            var array = [Country]()
                            self.empty = false
                            for country in result {
                                array.append(country.country)
                            }
                            self.coutries = array
                            self.view?.success()
                        }
                    }
                }
        })
    }
    func getCountriesFromNetwork() {
        if empty {
            self.networkConnection?.checkInternetConnection(complition: { (check) in
                if check {
                    self.dataFetcher?.fetchJSONData(
                                                request: .countries,
                                                model: CountriesModel.self,
                                                complition: { (result) in
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let countries):
                                    self.coutries = countries?.countryResourse.countries.country
                                    self.view?.success()
                                    self.coreDataService?.saveDataFromNetwork(
                                                                        key: .country,
                                                                        to: .countries,
                                                                        that: self.coutries!)
                                case .failure(let error):
                                    print(error)
                                    self.view?.failure(error: error)
                                }
                            }
                    })
                }
            })
        }
    }
}
