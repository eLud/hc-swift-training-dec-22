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
    @State private var releaseDate: Date = .now

    @State private var isSaved = false

    @ObservedObject var library: Library

    // iOS 15+
    @Environment(\.dismiss) var dismiss

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
            DatePicker(selection: $releaseDate) {
                Text("Release Date")
            }
            if scratched {
                Toggle("Still usable", isOn: $stillUsable)
            }

            if isSaved {
                Section {
                    Button("Saved") {
                        isSaved = false
                    }
                }
            }

            Section {
                Button("Save") {
                    let vinyl = Vinyl(albumName: albumName, artist: artistName, releaseDate: releaseDate, numberInSerie: nil, titles: [], scratched: scratched, speed: diskSpeed)
                    library.add(vinyl)
                    dismiss()
                }
                LibraryInfo(lib: library)
            }
        }
    }
}

struct LibraryInfo: View {

    @ObservedObject var lib: Library

    var body: some View {
        VStack {
            Text("\(lib.vinyls.count) vinyls in library")
            Button("Clear") {
                lib.vinyls = []
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(library: Library())
    }
}
