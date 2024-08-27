//
//  ContentView.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

struct ContentView: View {
    let spots: [Spot]?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            if ((spots) != nil) {
                ForEach(spots!, id: \.self.name) { spot in
                    SurfSpotView(spotInfo: spot)
                }
            } else {
                NoSurfSpotView()
            }
        }
        .padding(.all, 10.0)
    }
}
