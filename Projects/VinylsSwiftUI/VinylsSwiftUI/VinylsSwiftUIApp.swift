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
                NavigationView {
                    VinylListView(library: library)
                }
                .tabItem {
                    Label("Vinyls", systemImage: "opticaldisc")
                }
                ShopView()
                    .tabItem {
                        Label("Shop", systemImage: "cart")
                    }
                    .badge("New")
                NearbyShopsView()
                    .tabItem {
                        Label("Physical shops", systemImage: "cart")
                    }
            }
            .environmentObject(library)
        }
    }
}
