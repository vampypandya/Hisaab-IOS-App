//
//  TabBarView_Delete.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/3/21.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var viewController: HisaabController
    var body: some View {
        ZStack{
            TabView {
                HisaabListView()
                    .environment(\.managedObjectContext, self.viewContext)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Expense List")
                    }
                AddExpenseView()
                    .environment(\.managedObjectContext, self.viewContext)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Add Expense")
                    }
                Text("Insights")
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
//                        Text(viewController.sampleText)
                    }
                ProfileView()
                    .environment(\.managedObjectContext, self.viewContext)
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
                
            }
            .font(.headline)
            .foregroundColor(Color.black)
            .background(Color.white)
            .tabViewStyle(DefaultTabViewStyle())
        }
            
        }

    
}

//struct TabBarView_Delete_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView_Delete( items: <#FetchedResults<Expense>#>)
//    }
//}
