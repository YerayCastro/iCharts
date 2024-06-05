//
//  ExpensesBarChartView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct ExpensesBarChartView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    
    var body: some View {
        Chart(expensesViewModel.monthlyExpensesData) { data in
            Plot {
                BarMark(x: .value("month", month(for: data.month)),
                         y: .value("expenses", data.fixedExpenses))
                .foregroundStyle(by: .value("Expenses", "fixed"))
                .position(by: .value("Expenses", "fixed"))
        
                BarMark(x: .value("month", month(for: data.month)),
                         y: .value("expenses", data.variableExpense))
                .foregroundStyle(by: .value("Expenses", "variable"))
                .position(by: .value("Expenses", "variable"))
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    let formatted = DateFormatter()
    func month(for number: Int) -> String {
        formatted.shortStandaloneMonthSymbols[number - 1]
    }
}

#Preview {
    ExpensesBarChartView(expensesViewModel: .preview)
        .padding()
}
