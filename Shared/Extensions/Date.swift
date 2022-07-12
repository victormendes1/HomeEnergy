//
//  Date.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 11/07/22.
//

import Foundation

extension Date {
    var day: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    var hours: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "HH:m:ss"
        return formatter.string(from: self)
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "d/M/y"
        return formatter.string(from: self)
    }
    
}
