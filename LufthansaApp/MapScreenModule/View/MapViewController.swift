//
//  MapViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  @IBOutlet weak var mapView: MKMapView!
  var presenter: MapViewPresenterProtocol?
  let locationManager = CLLocationManager()
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    mapView.delegate = self
    presenter?.getNearestAirport()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checkLoctionEnabled()
  }
  
  func checkLoctionEnabled() {
    if CLLocationManager.locationServicesEnabled() {
      setupManager()
      checkAuthorization()
    } else {
      alertForLocationAccess(
        title: "You have turned off the geolocation service",
        message: "Do you want to turn on it?",
        url: "App-Prefs:root=LOCATION_SERVICES")
    }
  }
  
  func setupManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  func checkAuthorization() {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedAlways:
      break
    case .authorizedWhenInUse:
      mapView.showsUserLocation = true
      locationManager.startUpdatingLocation()
    case .denied:
      alertForLocationAccess(
        title: "You have turned off the geolocation service",
        message: "Do you want to turn on it?",
        url: UIApplication.openSettingsURLString)
    case .restricted:
      break
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    }
  }
  
  fileprivate func alertForLocationAccess(title: String?, message: String?, url: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) in
      guard let url = url, let unwrappedURL = URL(string: url) else { return }
      UIApplication.shared.open(unwrappedURL, options: [:], completionHandler: nil)
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    alert.addAction(settingsAction)
    alert.addAction(cancelAction)
    present(alert,animated: true, completion: nil)
  }
}
