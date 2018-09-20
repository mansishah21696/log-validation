//
//  search.swift
//  log
//
//  Created by TOPS on 9/5/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class search: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 21.1702, longitude: 72.8311, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311)
        marker.title = "surat"
        marker.snippet = "gujrat"
        marker.map = mapView

       
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    

    
}
