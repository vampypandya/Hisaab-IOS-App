//
//  HisaabListView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 10/30/21.
//

import SwiftUI

struct HisaabListView: View {
    @EnvironmentObject var viewController: HisaabController
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: Expense.entity(),sortDescriptors: [],animation: .default) var expenses: FetchedResults<Expense>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses) { expense in
                    ExpenseCardView(expense: expense)
                }
                .onDelete(perform: onDelete)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Expense List", displayMode: .large)
            .font(.headline)
            
        }
    }
    private func onDelete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                viewContext.delete(expenses[index])
            }
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func onMove(source: IndexSet, destination: Int) {
        print("On Move activated")
        withAnimation {
            viewController.moveExpense(source: source, destination: destination)
        }
    }
}

//struct HisaabListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HisaabListView()
//    }
//}

