//
//  WeeklyUsageTimeView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI
import Charts

struct WeeklyUsageTimeView: View {
    @Binding var consumption: TrackingType
    var homeAppliance: HomeAppliancesTypes
    
    private(set) var time: [Color] = [
        tertiaryBlue,
        secondaryBlue
    ]
    
    private(set) var energetic: [Color] = [
        tertiaryOrange,
        secondaryOrange
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            
            VStack(spacing: .zero) {
                HStack {
                    Image(systemName: consumption == .time ? "clock.fill" : "bolt.fill")
                    Text(consumption == .time ? "Tempo médio de uso por semana" : "Consumo médio de uso por semana")
                        .shadow(radius: 2)
                        .fontWeight(.semibold)
                }
                .padding(.vertical, 10)
                .foregroundColor(consumption == .time ? homeAppliance.secondaryColor : secondaryOrange)
                
                Divider()
                
                // MARK: Chart
                ZStack(alignment: .leading) {
                    Chart(Showers.consumptionWeekly) { item in
                        // TODO: Alterar a forma de destinguir os dados
                        if item.date == "Esta Semana" {
                            BarMark(
                                x: .value("Time", consumption == .time ? item.timeMedia : item.energeticMedia),
                                y: .value("Date", item.date),
                                width: 35
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            
                            .foregroundStyle(.linearGradient(
                                colors: consumption == .time ? time : energetic,
                                startPoint: .leading,
                                endPoint: .trailing))
                            
                        } else {
                            BarMark(
                                x: .value("Time", consumption == .time ? item.timeMedia : item.energeticMedia),
                                y: .value("Date", item.date),
                                width: 35
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .foregroundStyle(secondaryGray)
                        }
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .foregroundColor(.white)
                    .frame(height: 165)
                    .padding(.horizontal, 10)
                    .padding(.top, 23)
                    
                    // MARK: Chart Legends
                    VStack(alignment: .leading, spacing: 22) {
                        ForEach(Showers.consumptionWeekly) { shower in
                            VStack(alignment: .leading, spacing: 9) {
                                
                                HStack(alignment: .lastTextBaseline , spacing: 2) {
                                    if consumption == .time {
                                        Text("\(shower.timeMedia.asInt)")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                        
                                        Text("min/dia")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .opacity(0.5)
                                    } else {
                                        Text("\(shower.energeticMedia.asInt)")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                        
                                        Text("kWh/dia")
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
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .shadow(radius: 3)
        .foregroundColor(tertiaryGray)
        .padding(10)
    }
}

struct WeeklyUsageTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeeklyUsageTimeView(consumption: .constant(.energetic), homeAppliance: .shower)
                .preferredColorScheme(.dark)
        }
    }
}
