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
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, self.persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            self.persistenceController.save()
        }
    }
}
