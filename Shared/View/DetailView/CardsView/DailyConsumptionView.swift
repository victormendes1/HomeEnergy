//
//  DailyConsumptionView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

struct DailyConsumptionView: View {
    @Binding var consumption: TrackingType
    
    var homeAppliance: HomeAppliancesTypes
    var time: Int
    var energetic: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            
            VStack(spacing: .zero) {
                HStack {
                    Image(systemName: consumption == .time ? "clock.fill" : "bolt.fill")
                    Text(consumption == .time ? "Tempo médio de uso por dia" : "Consumo médio de uso por dia")
                        .shadow(radius: 2)
                        .fontWeight(.semibold)
                }
                .padding(.vertical, 8)
                .foregroundColor(consumption == .time ? homeAppliance.secondaryColor : secondaryOrange)
                
                Divider()
                
                HStack(alignment: .lastTextBaseline, spacing: 3) {
                    Text(consumption == .time ? "\(time)" : "\(energetic)")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text(consumption == .time ? "minutos" : "kWh")
                        .opacity(0.8)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                }
            }
        }
        .shadow(radius: 3)
        .foregroundColor(tertiaryGray)
        .padding(10)
    }
}

struct DailyConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DailyConsumptionView(consumption: .constant(.energetic), homeAppliance: .shower, time: 8, energetic: 54)
                .preferredColorScheme(.dark)
        }
    }
}
