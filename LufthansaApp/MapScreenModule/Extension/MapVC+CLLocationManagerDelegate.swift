//
//  MapVC+CLLocationManagerDelegate.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 14.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last?.coordinate {
      presenter?.latitute = location.latitude
      presenter?.logitude = location.longitude
      let radius: CLLocationDistance = 35000
      let region = MKCoordinateRegion(center: location,
                                      latitudinalMeters: radius,
                                      longitudinalMeters: radius)
      mapView.setRegion(region, animated: true)
    }
  }
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    checkAuthorization()
  }
}
