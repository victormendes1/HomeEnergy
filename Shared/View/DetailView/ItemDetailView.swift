//
//  ItemDetailView.swift
//  HomeEnergy
//
//  Created by Victor Mendes on 02/06/22.
//

import SwiftUI
import Charts

// MARK: - Main
struct ItemDetailView: View {
    @State private var selectedType: TrackingType = .time
    
    var averageConsumption = Showers.consumptionWeekly.first!.consumerMedia
    var isActive: Bool = true
    
    var body: some View {
        VStack {
            PickerSelectType(selectedType: $selectedType.animation(.easeInOut))
            
            ZStack {
                backgroundGray
                
                ScrollView {
                    DailyUseChartView(selectedType: $selectedType, homeAppliance: .shower)
                    isActive ? CurrentlyUsingView(selectedType: $selectedType, homeAppliances: .shower) : nil
                    DailyUsageTimeView(selectedType: $selectedType, homeAppliance: .shower, time: averageConsumption.asInt)
                    WeeklyUsageTimeView(selectedType: $selectedType, homeAppliance: .shower)
                }
            }
        }
        .navigationTitle("Chuveiro")
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PickerSelectType: View {
    @Binding var selectedType: TrackingType
    var body: some View {
        Picker("SelectType", selection: $selectedType) {
            ForEach(TrackingType.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}
// MARK: - Preview
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView()
                .preferredColorScheme(.dark)
        }
    }
}
