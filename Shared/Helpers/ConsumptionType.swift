//
//  ConsumptionType.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 14/07/22.
//

import SwiftUI

struct ConsumptionType: View {
    @Binding var type: TrackingType
    var body: some View {
        Picker("SelectType", selection: $type) {
            ForEach(TrackingType.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}
