//
//  MapVC+MKMapViewDelegate.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 14.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapPin else { return nil }
        var viewMarker: MKMarkerAnnotationView
        if let view = mapView
                            .dequeueReusableAnnotationView(withIdentifier:
                            String(describing:
                            MKMarkerAnnotationView.self))
                            as? MKMarkerAnnotationView {
            view.annotation = annotation
            viewMarker = view
        } else {
            viewMarker = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier:
                String(describing: MKMarkerAnnotationView.self))
            viewMarker.canShowCallout = true
            viewMarker.calloutOffset = CGPoint(x: 3, y: 3)
            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return viewMarker
    }
}
