//
//  ContentView.swift
//  ExpenseREportUI
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expensesBreakDown = ExpensesBreakDown()
 
    var body: some View {
        
        return VStack{
            
            renderHeader()
            ScrollView(showsIndicators: false) {
                VStack{
                    renderCards()
                    renderBarchart()
                    ExpensesBreakdownView(categories: expensesBreakDown.categories)
                        .padding(.horizontal)
                }
            }
            
        }.frame(maxHeight: .infinity,alignment: .top)
            .padding(.vertical)
    }
    
     fileprivate func renderCards() -> some View {
         return ScrollView(.horizontal, showsIndicators: false) {
             HStack(spacing: 10) {
                 ForEach(expensesBreakDown.categories){ category in
                     CardView(category: (category))
                        .frame(width: 330, height: UIScreen.main.bounds.height * 0.22)
                 }
             }.padding(.horizontal)
         }
     }
    
    fileprivate func renderHeader() -> some View{
        HStack{
            VStack(alignment: .leading) {
                Text(Date.fullMonthName(short: expensesBreakDown.expense.month)).font(.title)
                Text("2019").foregroundColor(Color.purple)
            }
            Spacer()
        }.padding(.horizontal)
    }
    
    
    fileprivate func renderBarchart() -> some View {
        return BarChartView(onSelected: { selectedExp in
            self.expensesBreakDown.generateRandom(selectedExp)
        }).frame(height: 50)
        .padding(.vertical, 20)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

