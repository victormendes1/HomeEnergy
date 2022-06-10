//
//  TesteArea.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 03/06/22.
//

import SwiftUI
import Charts

struct TesteArea: View {
    
    var body: some View {
        
        Chart {
            BarMark(
                x: . value("Valor", 150),
                y: . value("Valor", 100)
            )
        }
       // .chartLegend(.hidden)
      //  .chartXAxis(.hidden)
      //  .chartYAxis(.hidden)
        .frame(width: 100, height: 250)
    }
}


// MARK: - Preview
struct TesteArea_Previews: PreviewProvider {
    static var previews: some View {
        TesteArea()
    }
}
