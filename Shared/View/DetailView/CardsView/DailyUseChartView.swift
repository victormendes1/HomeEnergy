//
//  DailyUseChartView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct DailyUseChartView: View {
    var homeAppliance: TypesHomeAppliances
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(height: 250)
            .foregroundColor(.black)
            .overlay (
                Chart(Shower.showers) { element in
                    BarMark(
                        x: .value("Day", element.day),
                        y: .value("Time", element.time)
                    )
                    .foregroundStyle(Color(homeAppliance.systemColor).gradient)
                }
                    .backgroundStyle(Color.black)
                    .padding()
                    .frame(height: 250)
            )
    }
}
