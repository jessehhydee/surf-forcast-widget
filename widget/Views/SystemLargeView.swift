//
//  SystemLargeView.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 28/08/2024.
//

import SwiftUI

struct SystemLargeView: View {
    let entry: ForecastProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            if (entry.spots.count > 0) {
                ForEach(entry.spots.prefix(3), id: \.self.name) { spot in
                    SurfSpotView(spotInfo: spot)
                }
            } else {
                NoSurfSpotView()
            }
        }
    }
}
