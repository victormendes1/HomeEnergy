//
//  DailyUsageTimeView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

struct DailyUsageTimeView: View {
    @Binding var selectedType: TrackingType
    
    var homeAppliance: TypesHomeAppliances
    var time: Int
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 100)
                .foregroundColor(tertiaryGray)
                .overlay(
                    VStack {
                        VStack {
                            HStack {
                                Image(systemName: selectedType == .time ? "clock.fill" : "bolt.fill")
                                
                                if selectedType == .time {
                                    Text("Tempo médio de uso por dia")
                                        .fontWeight(.semibold)
                                } else {
                                    Text("Consumo médio de uso por dia")
                                        .fontWeight(.semibold)
                                }
                                
                            }
                            .foregroundColor(selectedType == .time ? homeAppliance.secondaryColor:
                                                secondaryOrange)
                            
                            Divider()
                        }
                        .offset(y: -8)
                        if selectedType == .time {
                            Text("\(time) minutos")
                        } else {
                            Text("\(time) minutos / 54Kwh")
                        }
                    }
                )
        }
        .padding(10)
    }
}
