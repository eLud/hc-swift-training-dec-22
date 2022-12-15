//
//  VinylListView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

struct VinylListView: View {

    @ObservedObject var library: Library
    @State private var showForm = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(library.vinyls) { vinyl in
                        NavigationLink(destination: Text("OI")) {
                            Text(vinyl.albumName)
                        }
                    }.onDelete { indexSet in
                        library.vinyls.remove(atOffsets: indexSet)
                    }.onMove { indexSet, index in
                        library.vinyls.move(fromOffsets: indexSet, toOffset: index)
                    }
                }
            }
            .sheet(isPresented: $showForm, content: {
                ContentView(library: library)
            })
            .toolbar {
                ToolbarItem {
                    Button("Add") {
                        showForm = true
//                        withAnimation {
//                            library.add(Vinyl(albumName: "Vinyl", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: true, speed: .rpm78))
//                        }
                    }
                }
            }
        }
    }
}

struct VinylListView_Previews: PreviewProvider {
    static var previews: some View {
        VinylListView(library: Library.demoLibrary())
    }
}
