//
//  LocationManager.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {

    @Published var latestLocation: CLLocation?

    let manager = CLLocationManager()

    override init() {
        super.init()

        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
    }

    func startGeoloc() {
        guard CLLocationManager.locationServicesEnabled() else { return }
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            return
        case .restricted:
            return
        case .denied:
            return
        default:
            break
        }
        manager.startUpdatingLocation()
//        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else { return }
        startGeoloc()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            latestLocation = loc
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Did fail \(error)")
    }
}
