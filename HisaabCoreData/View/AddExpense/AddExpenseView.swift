//
//  AddExpenseView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 10/30/21.
//

import SwiftUI

struct AddExpenseView: View {
    @State var expenseTitle:String = ""
    @State var expenseAmount:Int = 0
    @State private var category = "Red"
    @State private var expenseDate = Date()
    @State var isRecurring: Bool = false
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    @State private var showingCategorySheet = false
    let colors = ["Red", "Green", "Blue", "Black", "Tartan","test","test2","test3"]
    
    @EnvironmentObject var viewController: HisaabController
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        NavigationView {
            Form {
                Section("Basic") {
                    TextField("Title of Expense", text: $expenseTitle)
                    TextField("Amount", value: $expenseAmount, formatter: NumberFormatter())
                }
                
                Section("Category") {
                    Picker(selection: $category, label: Text("Category")) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(MenuPickerStyle())
                    Button(action: {
                        showingCategorySheet.toggle()
                        print("Add an Expense Controller")
                    }) {
                        HStack{
                            Text("Add a Category")
                            Spacer()
                            Image(systemName: "plus.square.on.square")
                            
                        }
                        
                    }
                }
                
                .sheet(isPresented: $showingCategorySheet) {
                    AddCategoryView()
                }
                
                Section("Timeline") {
                    DatePicker(selection: $expenseDate, in: ...Date(), displayedComponents: .date) {
                        Text("Select a date")
                    }
                    Toggle(isOn: $isRecurring) {
                        Text("Recurring Expense")
                    }
                }
                
                
                Section("Miscellaneous") {
                    ColorPicker("Color Code", selection: $bgColor)
                }
                
                
                Section{
                    Button(action: {
                        print("Add an Expense Controller")
                        let newExpense = Expense(context: self.viewContext)
                        newExpense.creationDate = Date.now
                        newExpense.expenseAmount = Int64(expenseAmount)
                        newExpense.expenseName = expenseTitle
                        newExpense.expenseCategory = category
                        newExpense.id = UUID()
                        viewController.addExpenseInController(toAddExpense: newExpense)
//                        self.hisaabList.append(newExpense)
//                        print(self.hisaabList)
                        do {
                            if viewContext.hasChanges {
                                print("Has some changes")
                                print(viewContext.insertedObjects)
                            } else {
                                print("No changes in viewContext")
                            }
                            
                            try self.viewContext.save()
                            print(self.viewContext.insertedObjects)
                            print("Expense saved.")
                            print("Is there any change? \(self.viewContext.hasChanges)")
                        } catch {
                            print(error.localizedDescription)
                            fatalError("Could not save the expense")
                        }
                        
                        
                        @FetchRequest(entity: Expense.entity(),sortDescriptors: []) var items: FetchedResults<Expense>
                        print("Checking if item is stored or not")
                        print(items.count)

                    }) {
                        Text("Add Expense")
                        
                    }
                }
            }
            .navigationTitle("Add Expense")
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
