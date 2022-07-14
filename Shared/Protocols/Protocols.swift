//
//  Protocols.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 10/06/22.
//

import UIKit

// MARK: - Usage Time
protocol Traceable: Identifiable {
    var date: String  { get set }
    var consumption: Consumption { get set }
}

extension Traceable {
    var id: UUID { UUID() }
}

// MARK: - Time Average
protocol Consumptions: Identifiable {
    associatedtype Consumption: Traceable
    
    var consumptions: [Consumption] { get set }
}

extension Consumptions {
    var id: UUID { UUID() }
    
    var timeMedia: Double {
        Double(consumptions.compactMap { $0.consumption.time }.reduce(0, +) / consumptions.count)
    }
    
    var energeticMedia: Double {
        Double(consumptions.compactMap { $0.consumption.energetic }.reduce(0, +) / consumptions.count)
    }
}
