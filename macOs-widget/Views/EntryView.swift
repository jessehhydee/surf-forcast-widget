//
//  EntryView.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI

struct WidgetEntryView : View {
    var entry: ForecastProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            if (entry.spots.count > 0) {
                ForEach(entry.spots, id: \.self.name) { spot in
                    SurfSpotView(spotInfo: spot)
                }
            } else {
                NoSurfSpotView()
            }
        }
        .padding(.all, 10.0)
    }
}
