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
    var viewModel: ItemDetailViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                viewModel.dailyUseChart()
                
                viewModel.averageTimeUseView(time: viewModel.averageWeeklyUse.asInt)
                
                viewModel.averageUsageWeek()
            }
        }
        .navigationTitle("Chuveiro")
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(viewModel: ItemDetailViewModel = ItemDetailViewModel()) {
        self.viewModel = ItemDetailViewModel()
    }
}


// MARK: - Preview
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView()
                .environmentObject(ItemDetailViewModel())
        }
    }
}
