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
    init(view: CountriesViewProtocol, dataFetcher: NetworkRequestProtocol, coreDataService: CoreDataServiceProtocol)
    func getCountries()
    var coutries: [Country]? {get set}
}

class CountriesPresenter: CountriesViewPresenterProtocol {
    weak var view: CountriesViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var coutries: [Country]?
    var coreDataService: CoreDataServiceProtocol?
    required init(view: CountriesViewProtocol, dataFetcher: NetworkRequestProtocol, coreDataService: CoreDataServiceProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.coreDataService = coreDataService
        getCountries()
    }
    func getCountries() {
        dataFetcher?.fetchJSONData(
                    request: .countries,
                    model: CountriesModel.self,
                    complition: { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let countries):
                    self.coutries = countries?.countryResourse.countries.country
                    self.view?.success()
//                    self.coreDataService?.saveDataFromNetwork(to: .countries, that: self.coutries!)
                case .failure(let error):
                    print(error)
                    self.view?.failure(error: error)
                }
            }
        })
    }
}
