//
//  Protocols.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 10/06/22.
//

import UIKit

// MARK: - Usage Time
protocol UsageTime: Identifiable {
    var day: String  { get set }
    var time: Int { get set }
}

extension UsageTime {
    var id: UUID { UUID() }
}

// MARK: - Time Average
protocol TimeAverage: Identifiable {
    associatedtype Time: UsageTime
    
    var week: String { get }
    var uses: [Time] { get set }
}

extension TimeAverage {
    var id: UUID { UUID() }
    
    var weeklyTimeAverage: Double {
        Double(uses.map { $0.time }.reduce(0, +) / uses.count)
    }
}
