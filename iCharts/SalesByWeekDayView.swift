//
//  SalesByWeekDayView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct SalesByWeekDayView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    @State private var medianSalesIsShown = true
    @State private var individualDaysAreShown = false
    
    var body: some View {
        VStack(alignment: .leading) {
            SalesWeekdayHeaderView(salesViewModel: salesViewModel)
            
            Chart {
                ForEach(salesViewModel.averageSalesByWeekday, id: \.number) {
                    BarMark(x: .value("Weekday", weekday(for: $0.number)),
                            y: .value("Average sales", $0.sales), width: .ratio(0.8))
                    .foregroundStyle(Color.gray)
                    .opacity(0.3)
                    
                    RectangleMark(x: .value("Weekday", weekday(for: $0.number)),
                                  y: .value("Average sales", $0.sales), height: 3)
                    .foregroundStyle(.gray)
                }
                
                if medianSalesIsShown {
                    RuleMark(y: .value("Median sales", salesViewModel.medianSales))
                        .foregroundStyle(.indigo)
                        .annotation(position: .top, alignment: .trailing) {
                            Text("Median: \(String(format: "%.2f", salesViewModel.medianSales))")
                                .font(.body)
                                .bold()
                                .foregroundStyle(.indigo)
                        }
                }
                
                if individualDaysAreShown {
                    ForEach(salesViewModel.salesByWeekday, id: \.number) { weekdayData in
                        ForEach(weekdayData.sales) { sale in
                            PointMark(x: .value("day", weekday(for: weekdayData.number)),
                                      y: .value("Sales", sale.quantity))
                            .opacity(0.3)
                        }
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            Toggle(individualDaysAreShown ? "Show all daily sales" : "Hide daily sales", 
                   isOn: $individualDaysAreShown.animation())
            Toggle(medianSalesIsShown ? "Show median sales" : "Hide median sales",
                   isOn: $medianSalesIsShown.animation())
            
            Spacer()
        }
        .padding()
    }
    
    let formatter = DateFormatter()
    func weekday(for number: Int) -> String {
        formatter.shortWeekdaySymbols[number - 1]
    }
}


#Preview {
    SalesByWeekDayView(salesViewModel: .preview)
}
