//
//  Shower.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 10/06/22.
//

import UIKit

struct Shower: Traceable {
    var date: String
    var consumption: Consumption
}


// TODO: Alterar a forma de armazenar todo consumo
struct Showers: Consumptions {
    var date: String
    var consumptions: [Shower]
}


// MARK: Data Local
extension Shower {
    static let showers: [Shower] = [
        .init(date: "Seg", consumption: .init(time: 7, energetic: 80)),
        .init(date: "Ter", consumption: .init(time: 4, energetic: 55)),
        .init(date: "Qua", consumption: .init(time: 5, energetic: 65)),
        .init(date: "Qui", consumption: .init(time: 6, energetic: 75)),
        .init(date: "Sex", consumption: .init(time: 10, energetic: 110)),
        .init(date: "Sáb", consumption: .init(time: 7, energetic: 80)),
        .init(date: "Dom", consumption: .init(time: 8, energetic: 90))
    ]
    
    static let lastWeekshowers: [Shower] = [
        .init(date: "Seg", consumption: .init(time: 9, energetic: 100)),
        .init(date: "Ter", consumption: .init(time: 8, energetic: 70)),
        .init(date: "Qua", consumption: .init(time: 7, energetic: 60)),
        .init(date: "Qui", consumption: .init(time: 10, energetic: 110)),
        .init(date: "Sex", consumption: .init(time: 8, energetic: 90)),
        .init(date: "Sáb", consumption: .init(time: 8, energetic: 90)),
        .init(date: "Dom", consumption: .init(time: 14, energetic: 120))
    ]
}

extension Showers {
    static var consumptionWeekly: [Showers] = [
        Showers(date: "Esta Semana", consumptions: Shower.showers),
        Showers(date: "Última Semana", consumptions: Shower.lastWeekshowers)
    ]
}
