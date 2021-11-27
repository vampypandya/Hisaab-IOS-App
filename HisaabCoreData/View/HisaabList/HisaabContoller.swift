//
//  HisaabContoller.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 10/26/21.
//

import Foundation
import SwiftUI

class HisaabController: ObservableObject {
    @Published private(set) var hisaabList:[Expense] = []
    @Environment(\.managedObjectContext) private var viewContext
    
//    init(assignedList: FetchedResults<Expense>) {
//        self.hisaabList = assignedList.map {$0}
//    }


//    [Expense(id: UUID(), expense_name: "TestExpense1_test", expense_category: "Test_Category", date_added: Date.now, amount: 200),
//      Expense(id: UUID(), expense_name: "TestExpense2_test", expense_category: "Test_Category", date_added: Date.now, amount: 300),
//      Expense(id: UUID(), expense_name: "TestExpense3", expense_category: "Test_Category", date_added: Date.now, amount: 400),
//      Expense(id: UUID(), expense_name: "TestExpense4", expense_category: "Test_Category", date_added: Date.now, amount: 500),
//      Expense(id: UUID(), expense_name: "TestExpense5", expense_category: "Test_Category", date_added: Date.now, amount: 600)]
    
    
//    [Expense(id: UUID(), expense_name: "TestExpense1_test", expense_category: "Test_Category", date_added: Date.now, amount: 200, expense_color: Color.green),
//      Expense(id: UUID(), expense_name: "TestExpense2_test", expense_category: "Test_Category", date_added: Date.now, amount: 300, expense_color: Color.red),
//      Expense(id: UUID(), expense_name: "TestExpense3", expense_category: "Test_Category", date_added: Date.now, amount: 400, expense_color: Color.blue),
//      Expense(id: UUID(), expense_name: "TestExpense4", expense_category: "Test_Category", date_added: Date.now, amount: 500, expense_color: Color.pink),
//      Expense(id: UUID(), expense_name: "TestExpense5", expense_category: "Test_Category", date_added: Date.now, amount: 600, expense_color: Color.cyan)]
    @Published var sampleText = "Test Sample"
    
    
    // MARK: - Save expense
    func addExpenseInController(toAddExpense: Expense) {
        self.hisaabList.append(toAddExpense)
//        print("Addinng an Expense: ")
//        let newExpense = Expense(context: viewContext)
//        newExpense.creationDate = Date.now
//        newExpense.expenseAmount = Int64(expenseAmount)
//        newExpense.expenseName = expenseName
//        newExpense.expenseCategory = expenseCategory
//        newExpense.id = UUID()
//        self.hisaabList.append(newExpense)
//        print(self.hisaabList)
//        do {
//            try viewContext.save()
//            print("Expense saved.")
//        } catch {
//            print(error.localizedDescription)
//        }
    
    }
    
    func updateText(updatedText: String) {
        self.sampleText = updatedText
    }
    
    func deleteExpense(offsets: IndexSet) {
        self.hisaabList.remove(atOffsets: offsets)
    }
    
    func moveExpense(source: IndexSet, destination: Int) {
        self.hisaabList.move(fromOffsets: source, toOffset: destination)
    }
 
    func loadExpenses() {
        self.hisaabList = self.hisaabList
    }
    
    func setList(assignedList: FetchedResults<Expense>) {
        self.hisaabList = assignedList.map {$0}
    }
    
//    func generateExpense(expenseName:String, expenseAmount:Int, expenseCategory: String, expenseDate: Date, isRecurring: Bool, bgColor: Color) -> Expense{
//        Expense(id: UUID(), expense_name: expenseName, expense_category: expenseCategory, date_added: expenseDate, amount: expenseAmount)
//    }
}

