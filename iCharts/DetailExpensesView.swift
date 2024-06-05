//
//  DetailExpensesView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI

struct DetailExpensesView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    
    var body: some View {
        List {
            Group {
                Section {
                    ExpensesLineChartView(expensesViewModel: expensesViewModel)
                }
                Section {
                    Text("Detailed Breakdown of Your Expenses per Month")
                        .bold()
                        .padding()
                    ExpensesDetailGridView(expensesViewModel: expensesViewModel)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    DetailExpensesView(expensesViewModel: .preview)
}
