//
//  NearbyShopsView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import SwiftUI

struct NearbyShopsView: View {

    @StateObject var locManager: LocationManager = LocationManager()

    var body: some View {
        VStack {
            if let loc = locManager.latestLocation {
                HStack {
                    Text("\(loc.coordinate.latitude)")
                    Text("\(loc.coordinate.longitude)")
                    Text("Speed \(loc.speed)")
                }
            }
            Button("Geoloc me") {
                locManager.startGeoloc()
            }
        }
    }
}

struct NearbyShopsView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyShopsView()
    }
}
