//
//  HomeAppliancesTypes.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

enum HomeAppliancesTypes {
    case shower
}

extension HomeAppliancesTypes {
    var name: String {
        switch self {
        case .shower:
            return "Chuveiro"
        }
    }
    
    var color: Color {
        switch self {
        case .shower:
            return .blue
        }
    }
    
    var secondaryColor: Color {
        switch self {
        case .shower:
            return secondaryBlue
        }
    }
    
    var tertiaryColor: Color {
        switch self {
        case .shower:
            return tertiaryBlue
        }
    }
    
    var systemColor: UIColor {
        switch self {
        case .shower:
            return .systemBlue
        }
    }
}

//extension TypesHomeAppliances {
//    var trackingType: TrackingType {
//        switch self.trackingType {
//        case .time:
//            break
//        case .energetic:
//            break
//        }
//    }
//
//    private var _trackingType: Color {
//        switch trackingType {
//        case .energetic:
//            return secondaryOrange
//        case .time:
//            break
//        }
//    }
//}
