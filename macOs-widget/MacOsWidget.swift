//
//  MacOsWidget.swift
//  macOs-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import WidgetKit
import SwiftUI

struct MacOsWidget: Widget {
    let kind: String = "Surf-Forcast-MacOs-Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: ForcastProvider()
        ) { entry in
            WidgetEntryView(entry: entry)
//                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Surf Forcast")
        .description("Displays your local surf spots forcast")
//        .supportedFamilies([.systemLarge])
        .supportedFamilies([
            .systemMedium,
            .systemLarge
        ])
    }
}
