//
//  SalesPerBookCategoryHeaderView.swift
//  iCharts
//
//  Created by Yery Castro on 4/6/24.
//

import SwiftUI

struct SalesPerBookCategoryHeaderView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        if let bestSellingCategory = salesViewModel.bestSellingCategory {
            Text("Your best selling category is ") +
            Text("\(bestSellingCategory.category.displayName)")
                .bold()
                .foregroundStyle(Color.accentColor) +
            Text(" with ") +
            Text("\(bestSellingCategoryPercentage ?? "")")
                .bold() +
            Text(" of all sales.")
        }
    }
    
    var bestSellingCategoryPercentage: String? {
        guard let bestSellingCategory = salesViewModel.bestSellingCategory else { return nil }
        let percentage = Double(bestSellingCategory.sales) /
        Double(salesViewModel.totalSales)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else { return nil }
        return formattedPercentage
    }
    
}

#Preview {
    SalesPerBookCategoryHeaderView(salesViewModel: .preview)
}
