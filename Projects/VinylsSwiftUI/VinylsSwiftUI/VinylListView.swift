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
        List {
            Section {
                if library.vinyls.isEmpty {
                    Button("Add new vinyls to start") {
                        showForm = true
                    }
                } else {
                    ForEach(library.vinyls) { vinyl in
                        NavigationLink(destination: Text(vinyl.albumName).padding()) {
                            Text(vinyl.albumName)
                        }
                    }.onDelete { indexSet in
                        library.vinyls.remove(atOffsets: indexSet)
                    }.onMove { indexSet, index in
                        library.vinyls.move(fromOffsets: indexSet, toOffset: index)
                    }
                }
            }
        }
        .navigationTitle("Vinyls")
        .sheet(isPresented: $showForm, content: {
            NavigationStack {
                ContentView(library: library)
                    .navigationTitle("Add")
            }
        })
        .toolbar {
            ToolbarItem {
                Button("Add", role: .destructive) {
                    showForm = true
                }.foregroundColor(.red)
            }
        }
    }
}

struct VinylListView_Previews: PreviewProvider {
    static var previews: some View {
        VinylListView(library: Library.demoLibrary())
    }
}
