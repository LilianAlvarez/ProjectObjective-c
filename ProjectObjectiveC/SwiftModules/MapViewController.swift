//
//  TakePhotoViewController.swift
//  ProjectObjectiveC
//
//  Created by Lilian on 21/07/2019.
//  Copyright © 2019 Lilian ALVAREZ. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }

    func setupMapView() {
        let center = CLLocationCoordinate2D(latitude: CLLocationDegrees(45), longitude: CLLocationDegrees(4.5))
        let span = MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.01), longitudeDelta: CLLocationDegrees(0.01))
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}
