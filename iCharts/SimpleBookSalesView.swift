//
//  SimpleBookSalesView.swift
//  iCharts
//
//  Created by Yery Castro on 29/5/24.
//

import SwiftUI

struct SimpleBookSalesView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        VStack {
            if let changedBookSales = changedBookSales() {
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: isPositiveChange ? "arrow.up.right" : "arrow.down.right")
                        .bold()
                        .foregroundStyle(isPositiveChange ? .green : .red)
                    Text("Your book sales ") +
                    Text(changedBookSales)
                        .bold() +
                    Text(" in the last 90 days.")
                }
            }
            
            WeeklyChartsView(salesViewModel: salesViewModel)
                .frame(height: 70)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
        }
    }
    
    var percentage: Double {
        Double(salesViewModel.totalSales) /
        Double(salesViewModel.lastTotalSales) - 1
    }
    
    var isPositiveChange: Bool {
        percentage > 0
    }
    
    func changedBookSales() -> String? {
        let percentage = percentage
        
        let numberFormatted = NumberFormatter()
        numberFormatted.numberStyle = .percent
        
        guard let formattedPercentage = numberFormatted.string(from: NSNumber(value: percentage)) else { return nil }
        
        let changeDescription = percentage < 0 ? "decrease by " : "increase by "
        return changeDescription + formattedPercentage
    }
}

#Preview {
    SimpleBookSalesView(salesViewModel: .preview)
        .padding()
}
