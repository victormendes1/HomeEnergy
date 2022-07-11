//
//  TypesHomeAppliances.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import SwiftUI

enum TypesHomeAppliances {
    case shower
}

extension TypesHomeAppliances {
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
