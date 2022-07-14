//
//  DailyUseChartView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct DailyUseChartView: View {
    @Binding var consumption: TrackingType
    var homeAppliance: HomeAppliancesTypes
    
    var body: some View {
        Rectangle()
            .frame(height: 350)
            .foregroundColor(.black)
            .overlay (
                Chart(Shower.showers) { element in
                    BarMark(
                        x: .value("Day", element.date),
                        y: .value("Time", consumption == .time ? element.consumption.time : element.consumption.energetic)
                    )
                    .foregroundStyle(Color(consumption == .time ? homeAppliance.systemColor : .systemOrange).gradient)
                }
                    .padding()
                    .frame(height: 350)
            )
    }
}
