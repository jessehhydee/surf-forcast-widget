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
                    SurfSpotView(spotInfo: spot)
                }
            } else {
                NoSurfSpotView()
            }
        }
        .padding(.all, 10.0)
    }
}

#Preview {
    ZStack {
        let surf = ParseSurfSpotJSON()
        ContentView(surf: surf)
    }
}
