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
    init (view: CitiesViewProtocol, dataFetcher: NetworkRequestProtocol)
    var cities: [CityModel]? {get set}
    func getCities()
}

class CitiesPresenter: CitiesViewPresenterProtocol {
    weak var view: CitiesViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var cities: [CityModel]?
    required init(view: CitiesViewProtocol, dataFetcher: NetworkRequestProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
        getCities()
    }
    func getCities() {
        dataFetcher?.fetchJSONData(
                        request: .cities,
                        model: CitiesModel.self,
                        complition: { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let cities):
                        self.cities = cities?.cityResource.cities.city
                        self.view?.success()
                    case .failure(let error):
                        self.view?.failure(error: error)
                    }
                }
        })
    }
}
