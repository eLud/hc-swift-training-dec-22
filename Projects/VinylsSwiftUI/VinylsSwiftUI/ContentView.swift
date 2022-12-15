//
//  ContentView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var diskSpeed: Vinyl.Speed = .rpm33
    @State private var albumName = ""
    @State private var artistName = ""
    @State private var scratched = false
    @State private var stillUsable = true

    var body: some View {
        Form {
            Picker("Disk rotation speed", selection: $diskSpeed) {
                ForEach(Vinyl.Speed.allCases) { speed in
                    Text(speed.title)
                        .tag(speed)
                }
            }
            //            .pickerStyle(.segmented)
            TextField("Album name", text: $albumName)
            TextField("Artist name", text: $artistName)
            Toggle("Is Scratched", isOn: $scratched)

            if scratched {
                Toggle("Still usable", isOn: $stillUsable)
            }

            Section {
                Button("Save") {
                    // Save the vinyl
                }
                Button("Cancel", role: .destructive) {
                    // Save the vinyl
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
