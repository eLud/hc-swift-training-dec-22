//
//  VinylsSwiftUIApp.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

@main
struct VinylsSwiftUIApp: App {

    @StateObject private var library = Library()

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView(library: library)
                    .tabItem {
                        Label("Vinyls", systemImage: "opticaldisc")
                    }
                Text("Shop")
                    .tabItem {
                        Label("Shop", systemImage: "cart")
                    }
            }
        }
    }
}
