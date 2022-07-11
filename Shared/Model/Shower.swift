//
//  Shower.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 10/06/22.
//

import UIKit

struct Shower: UsageTime {
    var day: String
    var time: Int
}

struct WeeklyShowerUse: TimeAverage {
    var uses: [Shower]
    var week: String
}


// MARK: Data Local
extension Shower {
    static let showers: [Shower] = [
        .init(day: "Seg", time: 5),
        .init(day: "Ter", time: 8),
        .init(day: "Qua", time: 8),
        .init(day: "Qui", time: 8),
        .init(day: "Sex", time: 15),
        .init(day: "Sáb", time: 10),
        .init(day: "Dom", time: 7)
    ]
    
    static let lastWeekshowers: [Shower] = [
        .init(day: "Seg", time: 6),
        .init(day: "Ter", time: 5),
        .init(day: "Qua", time: 5),
        .init(day: "Qui", time: 7),
        .init(day: "Sex", time: 8),
        .init(day: "Sáb", time: 10),
        .init(day: "Dom", time: 10)
    ]
}

extension WeeklyShowerUse {
    static var weeklyShowers: [WeeklyShowerUse] = [
        WeeklyShowerUse(uses: Shower.showers, week: "Esta Semana"),
        WeeklyShowerUse(uses: Shower.lastWeekshowers, week: "Última Semana")
    ]
}
