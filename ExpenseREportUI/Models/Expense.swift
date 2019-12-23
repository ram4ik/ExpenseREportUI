//
//  Expense.swift
//  ExpenseREportUI
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct Expense {
    
    var month: String = ""
    var budget: CGFloat = 0
    var consumed: CGFloat = 0
    var percentConsumed: CGFloat = 0
    private static let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    
    static func getRandom() -> [Expense]{
        months.map { month in
            
            let budget = CGFloat.random(in: 2000...10000)
            let consumed = CGFloat.random(in: 2000...budget)
            let percentConsumed = consumed / budget
            
            return Expense(month: month, budget: budget , consumed: consumed, percentConsumed: percentConsumed)
        }
    }
    
}
