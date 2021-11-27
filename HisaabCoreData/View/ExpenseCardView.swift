//
//  ExpenseCardView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 10/30/21.
//

import SwiftUI

struct ExpenseCardView: View {
    @ObservedObject var expense: Expense
    
    var currentColor = generateRandomColor()
    var body: some View {
        HStack{
            line
            Image(systemName: "face.smiling.fill")
                .resizable()
                .frame(width: 90, height: 90, alignment: .trailing)
                .padding(.all, 10)
                .foregroundColor(currentColor)
            VStack(alignment: .leading) {
    //            line
                Text(expense.expenseName ?? "No Value Present")
                    .font(.system(size: 25, weight: .heavy, design: .default))
                Text(expense.expenseCategory ?? "No Category Present")
                    .font(.system(size: 15, weight: .light, design: .default))
                HStack {
                    Label("\(expense.expenseAmount)", systemImage: "dollarsign.circle.fill")
                        .font(.system(size: 15, weight: .light, design: .default))
//                    Spacer()
                    Label("\(Text(expense.creationDate ?? Date.now, style: .date))", systemImage: "calendar.circle.fill")
                        .font(.system(size: 15, weight: .light, design: .default))
                }
                .font(.caption)
            }
            .padding(.all, 10)
            
        }
    }
    
    var line: some View {
        VStack {
            Rectangle()
                .foregroundColor(currentColor)
                .ignoresSafeArea()
                .frame(width: 20)
                
                
        }
    }
}



struct ExpenseCardView_Previews: PreviewProvider {
    static var previews: some View {
        let testExpense  = Expense()
        ExpenseCardView(expense: testExpense)
    }
}

func generateRandomColor() -> Color {
    let redValue = CGFloat(drand48())
    let greenValue = CGFloat(drand48())
    let blueValue = CGFloat(drand48())
        
    let randomColor = Color(red: redValue, green: greenValue, blue: blueValue)
        
    return randomColor
    }
