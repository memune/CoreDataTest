//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Taehoon Park on 2022/02/22.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
