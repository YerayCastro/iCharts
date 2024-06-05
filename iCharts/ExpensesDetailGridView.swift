//
//  ExpensesDetailGridView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI

struct ExpensesDetailGridView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    
    var body: some View {
        Grid(alignment: .trailing,
             horizontalSpacing: 15,
             verticalSpacing: 10) {
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                Text("Fixed")
                    .gridCellAnchor(.center)
                Text("Variable")
                    .gridCellAnchor(.center)
                Text("All")
                    .gridCellAnchor(.center)
            }
            
            Divider()
            
            ForEach(expensesViewModel.monthlyExpensesData) { data in
                GridRow {
                    Text(month(for: data.month))
                    Text(String(format: "%.2f", data.fixedExpenses))
                    Text(String(format: "%.2f", data.variableExpense))
                    Text(String(format: "%.2f", data.totalExpenses))
                        .bold()
                }
            }
            
            Divider()
            
            GridRow {
                Text("Total")
                    .bold()
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                    .gridCellColumns(2)
                Text("$" + String(format: "%.2f", expensesViewModel.totalExpenses))
                    .bold()
                    .foregroundStyle(.pink)
            }
        }
    }
    let formatted = DateFormatter()
    func month(for number: Int) -> String {
        formatted.shortStandaloneMonthSymbols[number - 1]
    }
}

#Preview {
    ExpensesDetailGridView(expensesViewModel: .preview)
}
