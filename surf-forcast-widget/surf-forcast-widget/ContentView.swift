//
//  ContentView.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

struct ContentView: View {
    let surf: SurfSpots?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            if ((surf?.surfSpots) != nil) {
                ForEach(surf!.surfSpots, id: \.self.name) { spot in
                    SurfSpotElement(spotInfo: spot)
                }
            } else {
                NoSurfSpotElement()
            }
        }
        .padding(.all, 10.0)
        .background(Color(hex: 0xffffff, opacity: 0.2))
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

#Preview {
    ZStack {
        let surf = ParseSurfSpotJSON()
        ContentView(surf: surf)
    }
}
