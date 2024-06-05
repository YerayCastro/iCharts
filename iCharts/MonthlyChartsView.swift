//
//  MonthlyChartsView.swift
//  iCharts
//
//  Created by Yery Castro on 28/5/24.
//

import SwiftUI
import Charts

struct MonthlyChartsView: View {
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesData) { sale in
            BarMark(x: .value("Month", sale.saleDate, unit: .month),
                    y: .value("Sales", sale.quantity)
            )
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
    }
}

#Preview {
    MonthlyChartsView(salesData: Sale.threeMonthsExamples())
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
