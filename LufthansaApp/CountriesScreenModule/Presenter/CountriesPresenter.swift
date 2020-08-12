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
    init(view: CountriesViewProtocol, dataFetcher: NetworkRequestProtocol)
    func getCountries()
    var coutries: CountriesModel? {get set}
}

class CountriesPresenter: CountriesViewPresenterProtocol {
    var coutries: CountriesModel?
    weak var view: CountriesViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    required init(view: CountriesViewProtocol, dataFetcher: NetworkRequestProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
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
                    self.coutries = countries
                    self.view?.success()
                case .failure(let error):
                    print(error)
                    self.view?.failure(error: error)
                }
            }
        })
    }
}
