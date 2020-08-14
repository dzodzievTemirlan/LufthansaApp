//
//  MapPresenter.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
import MapKit

protocol MapViewProtocol: class {
    func succees()
}

protocol MapViewPresenterProtocol {
    init (view: MapViewProtocol, dataFetcher: NetworkRequestProtocol)
    var latitute: Double? {get set}
    var logitude: Double? {get set}
    var nearestAirports: [AirportModelNearest]? {get set}
    func getNearestAirport()
}

class MapPresenter: MapViewPresenterProtocol {
    weak var view: MapViewProtocol?
    var dataFetcher:  NetworkRequestProtocol?
    var latitute: Double?
    var logitude: Double?
    var nearestAirports: [AirportModelNearest]?
    required init(view: MapViewProtocol, dataFetcher: NetworkRequestProtocol) {
        self.view = view
        self.dataFetcher = dataFetcher
    }
    func getNearestAirport() {
        guard let lat = latitute, let long = logitude else { return }
        dataFetcher?.fetchNearestAirports(lat: lat, long: long, complition: { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let airport):
                    self.nearestAirports = airport?.nearestAirportResource.airports.airport
                    self.view?.succees()
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}
