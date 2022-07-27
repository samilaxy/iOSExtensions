//
//  LocationManager.swift
//  AegisRiderCommunityApp
//
//  Created by Sajjad Malik on 23.02.22.
//

import Foundation
import UIKit
import CoreLocation

class LocationManager: NSObject {
    
    // MARK: - Constant
    var locationManager: CLLocationManager? = nil
    static let shared = LocationManager()
    
    // MARK: - Variable
    var currentLocation: CLLocation? = nil
    var currentLocationPlacemark: CLPlacemark? = nil
    
    fileprivate override init() {
        super.init()
        if(locationManager == nil) {
            locationManager = CLLocationManager()
        }
    }
    
    func getActualCurrentLocation() -> CLLocation? {
        return currentLocation
    }
    
    func getPlacemark() -> CLPlacemark? {
        return currentLocationPlacemark
    }
    
    func getFallbackLocation() -> CLLocation {
        return CLLocation(latitude: 45.501464, longitude: -73.568622)
    }
    
    func lookUpLocationPlacemark(locationToCheck: CLLocation?, completionHandler: @escaping (CLPlacemark?)
                    -> Void ) {
        // Use the last reported location.
        if let lastLocation = locationToCheck {
            let geocoder = CLGeocoder()
                
            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,
                        completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }
                else {
                 // An error occurred during geocoding.
                    completionHandler(nil)
                }
            })
        }
        else {
            // No location was available.
            completionHandler(nil)
        }
    }
}
