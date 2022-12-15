//
//  DemoSwiftUIApp.swift
//  DemoSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

@main
struct DemoSwiftUIApp: App {

    let isMac = false

    var body: some Scene {
        WindowGroup {
            ContentView(cornerSize: isMac ? 10 : 20)
                .padding()
                .background(Color.purple)
        }
    }
}
