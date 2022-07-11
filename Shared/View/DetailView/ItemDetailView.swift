//
//  ItemDetailView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 02/06/22.
//

import SwiftUI
import Charts

// MARK: - Main
struct ItemDetailView: View {
    var averageWeeklyUse = WeeklyShowerUse.weeklyShowers.first?.weeklyTimeAverage ?? 0
    var isActive: Bool = true
    
    var body: some View {
        ZStack {
           backgroundGray
             
            ScrollView {
                DailyUseChartView(homeAppliance: .shower)
                isActive ? CurrentlyUsingView(homeAppliances: .shower) : nil
                DailyUsageTimeView(homeAppliance: .shower, time: averageWeeklyUse.asInt)
                WeeklyUsageTimeView(homeAppliance: .shower)
            }
        }
        .navigationTitle("Chuveiro")
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
       
}

// MARK: - Preview
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView()
                .preferredColorScheme(.dark)
        }
    }
}
