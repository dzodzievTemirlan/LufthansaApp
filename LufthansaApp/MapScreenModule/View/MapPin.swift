//
//  MapPin.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 12.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import MapKit

protocol MapPinProtocol: MKAnnotation {
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String)
}

class MapPin: NSObject, MapPinProtocol {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    required init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.subtitle = subtitle
        self.title = title
    }
}
