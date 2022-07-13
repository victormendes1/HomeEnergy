//
//  CurrentlyUsingView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

struct CurrentlyUsingView: View {
    @Binding var selectedType: TrackingType
    var homeAppliances: TypesHomeAppliances
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(tertiaryGray)
                .frame(height: selectedType == . time ? 100 : 120)
                .overlay(
                    VStack {
                        VStack {
                            HStack {
                                Image(systemName: "hourglass")
                                    .foregroundColor(selectedType == .time ? homeAppliances.secondaryColor:
                                                        secondaryOrange
                                    )
                                
                                Text("Atualmente em uso")
                                    .fontWeight(.medium)
                                    .foregroundColor(selectedType == .time ? homeAppliances.secondaryColor:
                                                        secondaryOrange
                                    )
                            }
                            Divider()
                        }
                        .offset(y: -10)
                        
                        HStack(spacing: 5) {
                            Text("Este \(homeAppliances.name.lowercased()) esta em uso há")
                            
                            Text("4min")
                                .fontWeight(.bold)
                        }
                        
                        if selectedType == .energetic {
                            HStack (spacing: 5){
                                Text("Consumindo")
                                
                                Text("54 Kwh")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                        .foregroundColor(.white)
                )
                .padding(10)
        }
    }
}
