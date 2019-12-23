//
//  BarView.swift
//  ExpenseREportUI
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var size: CGSize = .zero
    var expense = Expense.getRandom().first!
    var isSelected = false
    var onSelected: ((Expense)->()) = {_ in }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 3, height: size.height)
                    .foregroundColor(Color.gray)
                Capsule()
                    .frame(width: 3, height: size.height * expense.percentConsumed)
                    .foregroundColor(isSelected ? Color.red : Color.purple)
            }       .animation(.easeIn(duration: 1) )

            
            Text(expense.month).font(.caption).foregroundColor(isSelected ? Color.red : Color.purple)
        }.frame(maxWidth: .infinity)
            .onTapGesture {
                self.onSelected(self.expense)
        }
    }
}

