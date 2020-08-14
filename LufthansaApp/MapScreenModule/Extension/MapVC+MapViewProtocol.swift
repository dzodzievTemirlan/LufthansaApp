//
//  MapVC+MapViewProtocol.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 14.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController: MapViewProtocol {
    func succees() {
        guard let airports = presenter?.nearestAirports  else { return }
        for pin in airports {
            let coordinate = CLLocationCoordinate2D(
                                                    latitude: pin.position.coordinate.lat,
                                                    longitude: pin.position.coordinate.long )
            let title = pin.airportCode
            let subtitle = pin.names.name.empty
            let annotation = MapPin(coordinate: coordinate, title: title, subtitle: subtitle)
            mapView.addAnnotation(annotation)
        }
    }
}
