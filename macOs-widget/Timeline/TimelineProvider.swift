//
//  TimelineProvider.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

struct ForecastProvider: TimelineProvider {
    private let placeholderEntry = ForecastEntry(
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
    
    func placeholder(in context: Context) -> ForecastEntry {
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        completion(placeholderEntry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ForecastEntry>) -> Void) {
        let currentDate = Date()
        var entries: [ForecastEntry] = []
        let amountOfSpotsAllowed: Int = switch context.family {
        case .systemLarge:
            3
        case .systemExtraLarge:
            6
        default:
            3
        }
        
        for hourOffset in 0 ..< 6 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let spots = SurflineWebScraper(amountOfSpotsToBeReturned: amountOfSpotsAllowed)!
            print(spots)
            let entry = ForecastEntry(date: entryDate, spots: spots)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
