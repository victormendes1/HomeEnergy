//
//  ItemDetailViewModel.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 10/06/22.
//

import SwiftUI
import Charts

class ItemDetailViewModel: ObservableObject {
    var averageWeeklyUse = WeeklyShowerUse.weeklyShowers.first?.weeklyTimeAverage ?? 0
    
    // MARK: - Daily use chart
    func dailyUseChart() -> some View {
        return Chart {
            ForEach(Shower.showers) { element in
                BarMark(
                    x: .value("Day", element.day),
                    y: .value("Time", element.time)
                )
            }
        }
        .padding()
        .frame(height: 250)
    }
    
    // MARK: - Average Usage Per Week
    func averageUsageWeek() -> some View {
        return RoundedRectangle(cornerRadius: 8)
            .foregroundColor(darkGray)
            .frame(height: 240)
            .overlay(
                Text("Média de consumo por semana")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -96)
            )
            .overlay(
                Chart(WeeklyShowerUse.weeklyShowers) { shower in
                    BarMark(
                        x: .value("Time", shower.weeklyTimeAverage),
                        y: .value("Name", shower.week)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .foregroundStyle(.linearGradient(colors: [darkBlue, .blue, waterBlue], startPoint: .bottomLeading, endPoint: .topTrailing))
                }
                    .overlay(
                        VStack(alignment: .leading, spacing: 40) {
                            ForEach(WeeklyShowerUse.weeklyShowers) { shower in
                                VStack(alignment: .leading, spacing: -2) {
                                    Text("\(shower.weeklyTimeAverage.asInt)min")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .shadow(radius: 2)
                                    
                                    
                                    Text(shower.week)
                                        .font(.subheadline)
                                        .shadow(radius: 2)
                                    
                                }
                            }
                        }
                            .position(x: 65, y: 90)
                    )
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(width: UIScreen.main.bounds.width-40, height: 180)
                    .position(x: 170, y: 150)
            )
            .padding(10)
    }
    
    // MARK: - Average time of use
    func averageTimeUseView(time: Int) -> some View {
        return VStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 80)
                .foregroundColor(darkGray)
                .overlay(
                    HStack(spacing: 5) {
                        Text("Tempo médio de uso")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        
                        Text("\(time)min")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                )
        }
        .padding(10)
    }
}
