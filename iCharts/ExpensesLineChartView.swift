//
//  ExpensesLineChartView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct ExpensesLineChartView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    let lineWidth: CGFloat =  2
    
    var body: some View {
        Chart(expensesViewModel.monthlyExpensesData) { data in
            Plot {
                LineMark(x: .value("month", data.month),
                         y: .value("expenses", data.fixedExpenses))
                .foregroundStyle(by: .value("Expenses", "fixed"))
                .symbol(by: .value("Expenses", "fixed"))
                LineMark(x: .value("month", data.month),
                         y: .value("expenses", data.variableExpense))
                .foregroundStyle(by: .value("Expenses", "variable"))
                .symbol(by: .value("Expenses", "variable"))
            }
            .lineStyle(StrokeStyle(lineWidth: lineWidth))
        }
        .aspectRatio(1, contentMode: .fit)
        .chartForegroundStyleScale(["variable": .purple,
                                    "fixed": .cyan])
        .chartXScale(domain: 0...13)
        .chartXAxis {
            AxisMarks(values: [1, 4, 7, 10]) { value in
                AxisGridLine()
                AxisTick()
                if let number = value.as(Int.self) {
                    AxisValueLabel(month(for: number), anchor: .top)
                }
            }
        }
        .chartYAxis {
            AxisMarks { value in
                AxisGridLine()
                AxisTick()
                if let number = value.as(Double.self) {
                    AxisValueLabel("\(Int(number / 1000)) K")
                }
            }
        }
    }
    
    let formatted = DateFormatter()
    func month(for number: Int) -> String {
        formatted.shortStandaloneMonthSymbols[number - 1]
    }
}

#Preview {
    ExpensesLineChartView(expensesViewModel: .preview)
        .padding()
}
