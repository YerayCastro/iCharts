//
//  SimpleSalesByWeekDayView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct SimpleSalesByWeekDayView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            SalesWeekdayHeaderView(salesViewModel: salesViewModel)
            
            Chart(salesViewModel.averageSalesByWeekday, id: \.number) {
                BarMark(x: .value("Weekday", weekday(for: $0.number)),
                        y: .value("Average sales", $0.sales), width: .ratio(0.8))
                .foregroundStyle(Color.accentColor.gradient)
                .opacity($0.number == salesViewModel.highestSellingWeekday?.number ? 1 : 0.5)
            }
            .frame(height: 70)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
    }
    
    let formatter = DateFormatter()
    func weekday(for number: Int) -> String {
        formatter.weekdaySymbols[number - 1]
    }
}

#Preview {
    SimpleSalesByWeekDayView(salesViewModel: .preview)
        .padding()
}
