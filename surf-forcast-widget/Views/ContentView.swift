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
        HStack(alignment: .top, spacing: 7.0) {
            VStack(alignment: .leading, spacing: 7.0) {
                if (spots != nil && spots!.count > 0) {
                    ForEach(spots!.prefix(3), id: \.self.name) { spot in
                        SurfSpotView(spotInfo: spot)
                    }
                } else {
                    NoSurfSpotView()
                }
            }
            .frame(minWidth: 340, maxWidth: 600)
            if (spots != nil && spots!.count > 3) {
                VStack(alignment: .leading, spacing: 7.0) {
                    ForEach(Array(spots!.dropFirst(3)), id: \.self.name) { spot in
                        SurfSpotView(spotInfo: spot)
                    }
                }
                .frame(minWidth: 340, maxWidth: 600)
            }
        }
        .padding(.all, 10.0)
    }
}
