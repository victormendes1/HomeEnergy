//
//  WeeklyUsageTimeView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct WeeklyUsageTimeView: View {
    var homeAppliance: TypesHomeAppliances
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(tertiaryGray)
            .frame(height: 240)
            .overlay(
                VStack {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(homeAppliance.secondaryColor)
                        
                        Text("Tempo médio de uso por semana")
                            .fontWeight(.medium)
                            .foregroundColor(homeAppliance.secondaryColor)
                    }
                    Divider()
                }
                    .offset(y: -90)
            )
            .overlay(
                Chart(WeeklyShowerUse.weeklyShowers) { shower in
                    if shower.weeklyTimeAverage < 8 {
                        
                        BarMark(
                            x: .value("Time", shower.weeklyTimeAverage),
                            y: .value("Name", shower.week),
                            width: 35
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .foregroundStyle(secondaryGray)
                    } else {
                        BarMark(
                            x: .value("Time", shower.weeklyTimeAverage),
                            y: .value("Name", shower.week),
                            width: 35
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .foregroundStyle(
                            .linearGradient(colors: [homeAppliance.tertiaryColor,
                                                     homeAppliance.color,
                                                     homeAppliance.secondaryColor],
                                            startPoint: .bottomLeading,
                                            endPoint: .topTrailing))
                    }
                }
                    .frame(height: 160)
                    .offset(y: 0)
                    .overlay(
                        VStack(alignment: .leading, spacing: 21) {
                            ForEach(WeeklyShowerUse.weeklyShowers) { shower in
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    HStack(alignment: .lastTextBaseline , spacing: 1) {
                                        Text("\(shower.weeklyTimeAverage.asInt)")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                        
                                        Text("min/dia")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .opacity(0.5)
                                    }
                                    
                                    Text(shower.week)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                            .position(x: 60, y: 58)
                    )
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(width: UIScreen.main.bounds.width-40, height: 180)
                    .position(x: 185, y: 150)
            )
            .padding(10)
    }
}
