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
    init (view: AirportsViewProtocol, dataFetcher: NetworkRequestProtocol)
    func getAirports()
    var airports: AirportsModel? {get set}
}
class AirportsPresenter: AirportsViewPresenterProtocol {
    weak var view: AirportsViewProtocol?
    var dataFetcher: NetworkRequestProtocol?
    var airports: AirportsModel?
    required init(view: AirportsViewProtocol, dataFetcher: NetworkRequestProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
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
                    self.airports = airports
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
}
