//
//  ExpenseCategoryView.swift
//  ExpenseREportUI
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ExpenseCategoryView: View {
    
    var category = ExpenseCategory()
    @State private var percent:CGFloat = 0.0
        
    var body: some View {
        GeometryReader{ gr in
            ZStack(alignment: .leading) {
                self.renderHorizontalChart(with: gr.size)
                HStack{
                    self.renderRingView()
                    Text(self.category.name).font(.system(size: 15, weight: .light))
                    Spacer()
                    Text("$\(String(format: "%.2f", self.category.amount) )").font(.system(size: 15, weight: .light))
                }.padding(5)
                    .onAppear {
                        self.percent = self.category.percent
                }
            }
        }.frame(height: 60)
    }
    
    fileprivate func renderRingView() -> some View {
        return RingView(strokeWidth: CGFloat(3), size: CGSize(width: 35, height: 35), color: self.category.colors.first!, pathColor: Color.gray, percent: self.$percent)
        .modifier(PercentAnimator(value: self.percent * 100, font: .caption,color: .primary)
            .animation(.easeIn(duration: 1)))
    }
    
    fileprivate func renderHorizontalChart(with size: CGSize) -> some View {
        return Rectangle().frame(width: size.width * self.percent, height: size.height, alignment: .leading)
        .foregroundColor(Color.gray)
        .animation(.easeIn(duration: 1))
    }
}

struct ExpenseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryView()
    }
}

