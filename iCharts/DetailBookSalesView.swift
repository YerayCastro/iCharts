//
//  DetailBookSalesView.swift
//  iCharts
//
//  Created by Yery Castro on 29/5/24.
//

import SwiftUI

struct DetailBookSalesView: View {
    enum TimeInterval: String, CaseIterable, Identifiable {
        case day = "Day"
        case week = "Week"
        case month = "Month"
        var id: Self { return self }
    }
    
    @ObservedObject var salesViewModel: SalesViewModel
    @State private var selectedTimeInterval = TimeInterval.day
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTimeInterval.animation()) {
                ForEach(TimeInterval.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time interval for chart")
            }
            .pickerStyle(.segmented)
            
            Group {
                Text("You sold ") +
                Text("\(salesViewModel.totalSales) books")
                    .bold()
                    .foregroundStyle(Color.accentColor) +
                Text(" in the last 90 days.")
            }
            .padding(.vertical)

            Group {
                switch selectedTimeInterval {
                case .day:
                    DailySalesChartsView(salesData: salesViewModel.salesData)
                case .week:
                    WeeklyChartsView(salesViewModel: salesViewModel)
                case .month:
                    MonthlyChartsView(salesData: salesViewModel.salesData)
                }
            }
            .aspectRatio(0.8, contentMode: .fit)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetailBookSalesView(salesViewModel: .preview)
}
