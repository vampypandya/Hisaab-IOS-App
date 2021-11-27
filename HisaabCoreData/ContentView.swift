//
//  ContentView.swift
//  HisaabCoreData
//
//  Created by Vishwam Pandya on 11/20/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var viewController = HisaabController()
    var showDeleteButton = false
    
    var body: some View {
        // DEBUG ONLY
        if showDeleteButton {
            Button("Delete All") {
                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Expense")
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

                do {
                    try viewContext.execute(deleteRequest)
                    try? viewContext.save()
                } catch _ as NSError {
                    fatalError("Error")
                }
            }
        }
        // Debug Close
        
        TabBarView()
            .environmentObject(viewController)
            .environment(\.managedObjectContext, self.viewContext)
            .preferredColorScheme(ColorScheme.light)
    }
}
    
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
