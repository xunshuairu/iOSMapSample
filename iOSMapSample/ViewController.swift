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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

