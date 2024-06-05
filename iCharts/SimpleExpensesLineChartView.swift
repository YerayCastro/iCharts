//
//  SimpleExpensesLineChartView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct SimpleExpensesLineChartView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    let lineGradient = LinearGradient(colors: [Color.pink.opacity(0.7), Color.pink.opacity(0.3)],
                                      startPoint: .top,
                                      endPoint: .bottom)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your total expenses for the last year are ") +
            Text("$\(String(format: "%.2f", expensesViewModel.totalExpenses))")
                .bold()
                .foregroundStyle(.pink)
            Chart(expensesViewModel.monthlyExpensesData) { data in
                AreaMark(x: .value("month", data.month),
                         y: .value("expenses", data.totalExpenses))
                .foregroundStyle(lineGradient)
            }
            .frame(height: 70)
            .chartXScale(domain: 1...12)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
    }
}

#Preview {
    SimpleExpensesLineChartView(expensesViewModel: .preview)
        .padding()
}
