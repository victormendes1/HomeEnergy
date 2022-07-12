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
                                Image(systemName: "clock.fill")
                                
                                Text("Tempo médio de uso por dia")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(selectedType == .time ? homeAppliance.secondaryColor:
                                                secondaryOrange)
                            
                            Divider()
                        }
                        .offset(y: -8)
                        
                        Text("\(time) minutos")
                    }
                )
        }
        .padding(10)
    }
}
