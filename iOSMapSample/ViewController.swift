//
//  ViewController.swift
//  iOSMapSample
//
//  Created by GaoLianjing on 12/23/15.
//  Copyright © 2015 GaoLianjing. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var labelView: UILabel!
    
    var locationmgr:CLLocationManager!
    
    var anontations:[Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationmgr = CLLocationManager()
        
        
        locationmgr.delegate = self
        locationmgr.desiredAccuracy = kCLLocationAccuracyBest
        let authstate = CLLocationManager.authorizationStatus()
        if(authstate == CLAuthorizationStatus.NotDetermined){
            locationmgr.requestWhenInUseAuthorization()
        }
        
        mapView.delegate = self
        self.mapView.showsUserLocation = true
        
        
        centerMapOnLocation(locationmgr.location!)
        labelView.text = String(locationmgr.location!.coordinate.latitude) + " " + String(locationmgr.location!.coordinate.longitude)
        
        
        
        let a1 = InterestLoc(title: "Location 1",
            locationName: "Location I marked",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 37.387200, longitude: -121.887763))
        
        let a2 = InterestLoc(title: "Location 2",
            locationName: "Location II marked",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 37.388201, longitude: -121.886762))
        
        mapView.addAnnotation(a1)
        mapView.addAnnotation(a2)
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    

}

