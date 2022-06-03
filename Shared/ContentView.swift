//
//  ContentView.swift
//  Shared
//
//  Created by Victor Mendes on 02/06/22.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0...0, id: \.self) { _ in
                    NavigationLink(destination: ItemDetailView()) {
                        Item()
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}


// MARK: - Item
fileprivate func Item() -> some View {
    return HStack(spacing: 20) {
        RoundedRectangle(cornerRadius: 8)
            .size(width: 120, height: 120)
            .foregroundColor(.blue)
            .overlay(
                Text("Chuveiro")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.leading, 15)
            )
    }
    .padding(10)
    .frame(height: 140)
    .background()
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("Home")
        }
        .preferredColorScheme(.dark)
    }
}
