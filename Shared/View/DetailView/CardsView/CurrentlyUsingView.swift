//
//  CurrentlyUsingView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

struct CurrentlyUsingView: View {
    var homeAppliances: TypesHomeAppliances
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(tertiaryGray)
                .frame(height: 100)
                .overlay(
                    VStack {
                        VStack {
                            HStack {
                                Image(systemName: "hourglass")
                                    .foregroundColor(homeAppliances.secondaryColor)
                                
                                Text("Atualmente em uso")
                                    .fontWeight(.medium)
                                    .foregroundColor(homeAppliances.secondaryColor)
                            }
                            Divider()
                        }
                        .offset(y: -10)
                        
                        HStack(spacing: 5) {
                            Text("Este \(homeAppliances.name.lowercased()) esta em uso há")
                            
                            Text("4min")
                                .fontWeight(.bold)
                        }
                    }
                        .foregroundColor(.white)
                )
                .padding(10)
        }
    }
}
