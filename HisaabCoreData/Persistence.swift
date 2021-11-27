//
//  Persistence.swift
//  HisaabCoreData
//
//  Created by Vishwam Pandya on 11/20/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Expense(context: viewContext)
            newItem.id = UUID()
            newItem.creationDate = Date.now
            newItem.expenseAmount = 300
            newItem.expenseCategory = "TestCategory"
            newItem.expenseName = "TestExpense"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "HisaabCoreData")
        if inMemory {
            print("Loadinng data from InMemory Storage")
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        print("Loadinng data from Persistent Storage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
        print("Checking background change")
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error while saving context on channge in window")
            }
        } else {
            print("No changes, so nont saving anything")
        }
    }
}
