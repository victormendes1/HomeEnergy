//
//  WeeklyUsageTimeView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct WeeklyUsageTimeView: View {
    @Binding var selectedType: TrackingType
    var homeAppliance: TypesHomeAppliances
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(tertiaryGray)
            .frame(height: 240)
            .overlay(
                VStack {
                    HStack {
                        Image(systemName: selectedType == .time ? "clock.fill" : "bolt.fill")
                            .foregroundColor(selectedType == .time ? homeAppliance.secondaryColor:
                                                secondaryOrange)
                        
                        if selectedType == .time {
                            Text("Tempo médio de uso por semana")
                                .fontWeight(.medium)
                                .foregroundColor(homeAppliance.secondaryColor)
                        } else {
                            Text("Consumo médio de uso por semana")
                                .fontWeight(.medium)
                                .foregroundColor(secondaryOrange)
                        }
                    }
                    Divider()
                }
                    .offset(y: -90)
            )
            .overlay(
                Chart(Showers.consumptionWeekly) { shower in
                    if shower.consumerMedia < 8 {
                        
                        BarMark(
                            x: .value("Time", shower.consumerMedia),
                            y: .value("Name", shower.date),
                            width: 35
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .foregroundStyle(secondaryGray)
                    } else {
                        BarMark(
                            x: .value("Time", shower.consumerMedia),
                            y: .value("Name", shower.date),
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
                            ForEach(Showers.consumptionWeekly) { shower in
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    HStack(alignment: .lastTextBaseline , spacing: 1) {
                                        if selectedType == .time {
                                            Text("\(shower.consumerMedia.asInt)")
                                                .font(.title)
                                                .fontWeight(.semibold)
                                            
                                            Text("min/dia")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .opacity(0.5)
                                        } else {
                                            Text("54")
                                                .font(.title)
                                                .fontWeight(.semibold)
                                            
                                            Text("Kwh/dia")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .opacity(0.5)
                                        }
                                    }
                                    Text(shower.date)
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
