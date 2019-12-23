//
//  DateExt.swift
//  ExpenseREportUI
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

extension Date{
    
    static var month: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: Date())
    }
    
    static func fullMonthName(short: String)-> String{
        let months = [
            "Jan":"January",
            "Feb":"February",
            "March":"Mar",
            "Apr":"April",
            "May":"May",
            "June":"June",
            "Jul":"July",
            "Aug":"August",
            "Sep":"September",
            "Oct":"October",
            "Nov":"November",
            "Dec":"December",
        ]
        
        return months[short] ?? "January"
    }
}
