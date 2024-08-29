//
//  NoSurfSpotView.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI

struct NoSurfSpotView: View {
    var body: some View {
        HStack(alignment: .top) {
            Capsule()
                .fill(Color(hex: 0xFF0000))
                .frame(maxWidth: 5)
            VStack(alignment: .leading) {
                Text("No surf spot info...")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Head to settings to add surf spots.")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(minHeight: 80, alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}
