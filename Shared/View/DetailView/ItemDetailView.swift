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
    @State private var type: TrackingType = .time
    
    var averageConsumptionTime = Showers.consumptionWeekly.first!.timeMedia
    var averageConsumptionEnergitc = Showers.consumptionWeekly.first!.energeticMedia
    var isActive: Bool = true
    
    var body: some View {
        VStack {
            ConsumptionType(type: $type.animation(.default.speed(1.5)))
            
            ZStack {
                backgroundGray
                
                ScrollView {
                    DailyUseChartView(consumption: $type, homeAppliance: .shower)
                    isActive ? CurrentlyUsingView(consumption: $type, homeAppliances: .shower) : nil
                    DailyConsumptionView(consumption: $type, homeAppliance: .shower, time: averageConsumptionTime.asInt, energetic: averageConsumptionEnergitc.asInt)
                    WeeklyUsageTimeView(consumption: $type, homeAppliance: .shower)
                }
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
