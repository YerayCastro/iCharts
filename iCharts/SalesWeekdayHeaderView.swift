//
//  SalesWeekdayHeaderView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI

struct SalesWeekdayHeaderView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    var body: some View {
        if let highestSellingWeekday = salesViewModel.highestSellingWeekday {
           Text("Your highest selling day of the week is ") +
            Text("\(weekday(for: highestSellingWeekday.number)) ")
                .bold()
                .foregroundStyle(Color.accentColor) +
            Text("\(Int(highestSellingWeekday.sales)) sales per day")
                .bold()
        }
    }
    let formatter = DateFormatter()
    func weekday(for number: Int) -> String {
        formatter.weekdaySymbols[number - 1]
    }
}

#Preview {
    SalesWeekdayHeaderView(salesViewModel: .preview)
}
