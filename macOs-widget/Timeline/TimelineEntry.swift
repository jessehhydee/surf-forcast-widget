//
//  TimelineEntry.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

struct ForecastEntry: TimelineEntry {
    let date: Date
    let spots: [Spot]
}
