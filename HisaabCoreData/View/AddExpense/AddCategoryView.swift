//
//  AddCategoryView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/3/21.
//

import SwiftUI

struct AddCategoryView: View {
    @State var categoryTitle:String = ""
    @State var amount:String = ""
    @State private var selection = "Red"
    @State private var birthDate = Date()
    @State var includeInStats: Bool = false
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    var body: some View {
        NavigationView {
            Form {
                TextField("Title of Category", text: $categoryTitle)
                Toggle(isOn: $includeInStats) {
                    Text("Include in Stats")
                }
                
                Section{
                    Button(action: {
                        print("Add an Expense Category")
                    }) {
                        Text("Add Category")
                        
                    }
                }
                
            }
            .navigationTitle("Add Category")
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
