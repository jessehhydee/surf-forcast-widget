//
//  NoSurfSpotView.swift
//  surf-forcast-widget
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
            Text("No surf spot info...")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}
