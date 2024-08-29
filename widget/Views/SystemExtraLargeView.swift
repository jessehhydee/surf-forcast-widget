//
//  SystemExtraLargeView.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 28/08/2024.
//

import SwiftUI

struct SystemExtraLargeView: View {
    let entry: ForecastProvider.Entry
    
    var body: some View {
        HStack(alignment: .top, spacing: 7.0) {
            VStack(alignment: .leading, spacing: 7.0) {
                if (entry.spots.count > 0) {
                    ForEach(entry.spots.prefix(3), id: \.self.name) { spot in
                        SurfSpotView(spotInfo: spot)
                    }
                } else {
                    NoSurfSpotView()
                }
            }
            VStack(alignment: .leading, spacing: 7.0) {
                if (entry.spots.count > 3) {
                    ForEach(Array(entry.spots.dropFirst(3)), id: \.self.name) { spot in
                        SurfSpotView(spotInfo: spot)
                    }
                }
            }
        }
    }
}
