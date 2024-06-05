//
//  SalesPerBookCategoryBarChartView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI
import Charts

struct SalesPerBookCategoryBarChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        Chart(salesViewModel.totalSalesPerCategory, id: \.category) { data in
            BarMark(x: .value("Sales", data.sales),
                    y: .value("Book Category", data.category.displayName))
            .annotation(position: .trailing,
                        alignment: .leading,
                        content: {
                Text("\(data.sales)")
                    .opacity(salesViewModel.bestSellingCategory?.category == data.category ? 1 : 0.3)
            })
            .cornerRadius(5)
            .opacity(salesViewModel.bestSellingCategory?.category == data.category ? 1 : 0.3)
            .foregroundStyle(by: .value("Category", data.category.displayName))
        }
        .aspectRatio(1, contentMode: .fit)
        .chartLegend(.hidden)
        .chartForegroundStyleScale([BookCategory.fiction.displayName: .purple,
                                    BookCategory.business.displayName: .cyan,
                                    BookCategory.children.displayName: .yellow,
                                    BookCategory.computerScience.displayName: .indigo])
    }
}

#Preview {
    SalesPerBookCategoryBarChartView(salesViewModel: .preview)
        .padding()
}
