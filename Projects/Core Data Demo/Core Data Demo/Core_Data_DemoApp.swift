//
//  Core_Data_DemoApp.swift
//  Core Data Demo
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import SwiftUI

@main
struct Core_Data_DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
