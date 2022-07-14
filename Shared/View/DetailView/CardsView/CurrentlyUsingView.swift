//
//  CurrentlyUsingView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

struct CurrentlyUsingView: View {
    @Binding var consumption: TrackingType
    var homeAppliances: HomeAppliancesTypes
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            
            VStack(spacing: .zero) {
                HStack {
                    Image(systemName: "hourglass")
                    Text("Atualmente em uso")
                        .shadow(radius: 2)
                        .fontWeight(.semibold)
                        .foregroundColor(consumption == .time ? homeAppliances.secondaryColor : secondaryOrange)
                }
                .padding(.vertical, 8)
                .foregroundColor(consumption == .time ? homeAppliances.secondaryColor : secondaryOrange)
                
                Divider()
                
                HStack(spacing: 5) {
                    Text("Este \(homeAppliances.name.lowercased()) esta em uso há")
                    Text("4 minutos")
                        .fontWeight(.semibold)
                }
                .padding(.top, 15)
                .padding(.bottom, consumption == .time ? 15 : 8)
                .foregroundColor(.white)
                
                if consumption == .energetic {
                    HStack (spacing: 5) {
                        Text("Consumindo")
                        Text("54 Kwh")
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 15)
                    .foregroundColor(.white)
                }
            }
        }
        .shadow(radius: 3)
        .foregroundColor(tertiaryGray)
        .padding(10)
    }
}

struct CurrentlyUsingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CurrentlyUsingView(consumption: .constant(.time), homeAppliances: .shower)
                .preferredColorScheme(.dark)
        }
    }
}
