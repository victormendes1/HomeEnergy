//
//  TesteArea.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 03/06/22.
//

import SwiftUI
import Charts

struct TesteChart: Identifiable, Hashable {
    let id = UUID()
    var day: String
    var value: Int
}

let dataOne = [
    TesteChart(day: "Seg", value: 6),
    TesteChart(day: "Ter", value: 7)
]
let dataTwo = [
    TesteChart(day: "Seg", value: 10),
    TesteChart(day: "Ter", value: 9),
    TesteChart(day: "Qua", value: 7),
    TesteChart(day: "Qui", value: 6),
]

var media: Double {
    Double(dataOne.compactMap { $0.value }.reduce(0, +) / dataOne.count)
}

var otherMedia: Double {
    Double(dataOne.compactMap { $0.value }.reduce(0, +) / dataOne.count)
}

struct TesteArea: View {
    @State private var selectedType: TrackingType = .time
    

    var data: [TesteChart] {
        switch selectedType {
        case .time:
            return dataOne
        case .energetic:
            return dataTwo
        }
    }
    
    
    var body: some View {
        VStack {
            
            
            Picker("Consumo", selection: $selectedType.animation(.default)) {
                Text("Tempo").tag(TrackingType.time)
                Text("Energia").tag(TrackingType.energetic)
            }
            .pickerStyle(.segmented)
            
            
            
            Chart(data) { element in
                BarMark(
                    x: .value("Valor", element.value),
                    y: .value("Data", element.day)
                )
            }
            .padding()
            .frame(width: 400, height: 250)
        }
        .padding()
    }
}

// MARK: - Preview
struct TesteArea_Previews: PreviewProvider {
    static var previews: some View {
        TesteArea()
    }
}
