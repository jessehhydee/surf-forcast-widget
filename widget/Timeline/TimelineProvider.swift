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
                name: "Otaki Beach",
                sizeHumanReadable: "Overhead to well overhead",
                sizeFt: "3-4",
                windDir: "Onshore wind",
                windSpeed: "26",
                grade: "VERY POOR"
            ),
            Spot(
                name: "New Brighton Pier",
                sizeHumanReadable: "Thigh to Waist",
                sizeFt: "1-2",
                windDir: "Offshore wind",
                windSpeed: "8",
                grade: "POOR TO FAIR"
            ),
            Spot(
                name: "Stent Road",
                sizeHumanReadable: "2x overhead",
                sizeFt: "4-6",
                windDir: "Offshore wind",
                windSpeed: "3",
                grade: "GOOD"
            )
        ]
    )
    
    func placeholder(in context: Context) -> ForecastEntry {
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        Task {
            let entry = await getTimelineEntry(context: context, date: .now)
            completion(entry)
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ForecastEntry>) -> Void) {
        Task {
            let entry = await getTimelineEntry(context: context, date: .now)
            let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 10800))) // 3 hrs
            completion(timeline)
        }
    }
    
    func getTimelineEntry(context: Context, date: Date) async -> ForecastEntry {
        let amountOfSpotsAllowed: Int = switch context.family {
        case .systemLarge:
            3
        case .systemExtraLarge:
            6
        default:
            3
        }
        
        let spotUrls = GetSurfSpotUrls()
        let spots = await SurflineWebScraper(spotUrls: spotUrls, amountOfSpotsToBeReturned: amountOfSpotsAllowed)!
        return ForecastEntry(date: date, spots: spots)
    }
}
