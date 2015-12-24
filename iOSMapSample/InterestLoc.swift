//
//  InterestLoc.swift
//  iOSMapSample
//
//  Created by GaoLianjing on 12/24/15.
//  Copyright © 2015 GaoLianjing. All rights reserved.
//

import Foundation
import MapKit

class InterestLoc: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}