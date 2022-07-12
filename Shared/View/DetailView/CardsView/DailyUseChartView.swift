//
//  DailyUseChartView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct DailyUseChartView: View {
    @Binding var selectedType: TrackingType
    var homeAppliance: TypesHomeAppliances
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(height: 250)
            .foregroundColor(.black)
            .overlay (
                Chart(Shower.showers) { element in
                    BarMark(
                        x: .value("Day", element.date),
                        y: .value("Time", selectedType == .time ? element.consumption.time : element.consumption.energetic)
                    )
                    .foregroundStyle(Color(selectedType == .time ? homeAppliance.systemColor : .systemOrange).gradient)
                }
                    .backgroundStyle(Color.black)
                    .padding()
                    .frame(height: 250)
            )
    }
}
