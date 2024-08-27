//
//  TimelineProvider.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

struct ForcastProvider: TimelineProvider {
    private let placeholderEntry = ForcastEntry(
        date: Date(),
        spots: [
            Spot(
                name: "Taylors Mistake",
                sizeHumanReadable: "Waist to chest",
                sizeFt: "1-3",
                windDir: "Offshore wind",
                windSpeed: "8",
                grade: "Fair"
            )
        ]
    )
    
    func placeholder(in context: Context) -> ForcastEntry {
        print("PLACEHOLDER")
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ForcastEntry) -> ()) {
        print("SNAPSHOT")
        completion(placeholderEntry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ForcastEntry>) -> Void) {
        print("TIMELINE")
        let currentDate = Date()
        var entries: [ForcastEntry] = []
        
        for hourOffset in 0 ..< 6 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let spots = ParseSurfSpotJSON()!.surfSpots
            print("spots: \(spots)")
            let entry = ForcastEntry(date: entryDate, spots: spots)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
