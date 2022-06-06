//
//  ItemDetailView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 02/06/22.
//

import SwiftUI

let darkGray = Color.init(red: 0.2, green: 0.2, blue: 0.2, opacity: 1)

struct ItemDetailView: View {
    var body: some View {
        ZStack {
            ScrollView {
                
                useWithinTimeRangeView()
                    .overlay(
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                usageTimeBarView(day: "Qua", usage: 4)
                                usageTimeBarView(day: "Qui", usage: 3)
                                usageTimeBarView(day: "Sex", usage: 6)
                                usageTimeBarView(day: "Dom", usage: 8)
                                usageTimeBarView(day: "Seg", usage: 4)
                                usageTimeBarView(day: "Ter", usage: 3)
                                usageTimeBarView(day: "Qua", usage: 6)
                                usageTimeBarView(day: "Qui", usage: 4)
                                usageTimeBarView(day: "Sex", usage: 7)
                                usageTimeBarView(day: "Sáb", usage: 15)
                            }
                        }
                            .frame(width: 280)
                            .offset(x: -20, y: 30)
                    )
                    .overlay(
                        timeIntervalView()
                    )
                
                averageTimeUseView()
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(darkGray)
                    .frame(height: 200)
                    .overlay(
                        Text("Média de consumo por semana")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .offset(x: 0, y: -75)
                        
                    )
                    .overlay(
                        weeklyConsumerMediaView()
                    )
                    .padding(10)
            }
        }
        .navigationTitle("Chuveiro")
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Weekly Consumer Media View
fileprivate func weeklyConsumerMediaView() -> some View {
    return VStack(alignment: .leading, spacing: 40) {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: 130, height: 25)
            .overlay(alignment: .leading) {
                Text("54min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .offset(y: -25)
            }
        
        RoundedRectangle(cornerRadius: 2)
            .frame(width: 90, height: 25)
            .overlay(alignment: .leading) {
                Text("39min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .offset(y: -25)
            }
        
    }
    .foregroundColor(.white)
    .offset(x: -95, y: 35)
}
// MARK: - Time interval
fileprivate func timeIntervalView() -> some View {
    return VStack(spacing: 70) {
        Text("15")
        Text("10")
        Text("0")
    }
    .offset(x: 145, y: 10)
    .foregroundColor(.white)
}
// MARK: - Usage Time Bar
fileprivate func usageTimeBarView(day: String, usage: Int) -> some View {
    let standardTime = 900.0 // 15min in seconds
    var usedTime = Double(usage * 60)
    
    if usage < 0 {
        usedTime = 0
    } else if usage > 15 {
        usedTime = 900
    }
    
    let usageTimeByPercentage = (usedTime/standardTime) * 100
    let standardHeight = 180.0
    let heightByPercentage = (standardHeight * usageTimeByPercentage)/100
    return VStack {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: 25, height: heightByPercentage)
        
        Text(day)
    }
    .frame(width: 40, height: 210, alignment: .bottom)
    .foregroundColor(.white)
}
// MARK: - Use within time range
fileprivate func useWithinTimeRangeView() -> some View {
    return VStack {
        RoundedRectangle(cornerRadius: 0)
            .frame(height: 300)
            .foregroundColor(darkGray)
            .overlay(
                Text("Consumo durante os ultimos 7 dias")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -125)
            )
    }
    .padding(10)
}
// MARK: - Average time of use
fileprivate func averageTimeUseView() -> some View {
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
                    
                    Text("\(8)min")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            )
    }
    .padding(10)
}

// MARK: - Preview
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView()
        }
        .preferredColorScheme(.dark)
    }
}
