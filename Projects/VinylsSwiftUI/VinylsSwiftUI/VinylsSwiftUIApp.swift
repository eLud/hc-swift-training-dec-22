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
            ContentView(library: library)
        }
    }
}
