//
//  Frequency.swift
//  HomeEnergy (iOS)
//
//  Created by Victor Mendes on 13/06/22.
//

import Foundation

enum Frequency: Int, CaseIterable {
    case diary
    case weekly
    case monthly
    case yearly
}

extension Frequency {
    var asString: String {
        switch self {
        case .diary:
            return "Diário"
        case .weekly:
            return "Semanal"
        case .monthly:
            return "Mensal"
        case .yearly:
            return "Anual"
        }
    }
}
