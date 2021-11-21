//
//  HisaabCoreDataApp.swift
//  HisaabCoreData
//
//  Created by Vishwam Pandya on 11/20/21.
//

import SwiftUI

@main
struct HisaabCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
