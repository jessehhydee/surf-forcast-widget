//
//  TimelineEntry.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

struct ForcastEntry: TimelineEntry {
    let date: Date
    let spots: [Spot]
}
