//
//  LocationManager.swift
//  WeatherApp
//
//  Created by ilayda akçin on 4.10.2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    let manager = CLLocationManager()
        
        @Published var location: CLLocationCoordinate2D?
        @Published var isLoading = false
        
        override init() {
            super.init()
            
            manager.delegate = self
        }
        
    // MARK: - Functions
        func requestLocation() {
            isLoading = true
            manager.requestLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            location = locations.first?.coordinate
            isLoading = false
        }
        
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error getting location", error)
            isLoading = false
        }
    }
