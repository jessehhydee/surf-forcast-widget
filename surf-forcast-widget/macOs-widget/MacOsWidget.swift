//
//  MacOsWidget.swift
//  macOs-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import WidgetKit
import SwiftUI

struct SurfSpots: Codable {
    let surfSpots: [Spot]
}

struct Spot: Codable {
    let name: String
    let sizeHumanReadable: String
    let sizeFt: String
    let windDir: String
    let windSpeed: String
    let grade: String
}

func ParseSurfSpotJSON() -> SurfSpots? {
    var surfSpots: SurfSpots?
    
    let homeURL = FileManager.default.homeDirectoryForCurrentUser
    let forcastDataURL = homeURL.appendingPathComponent("code/surf-notify/forcast-data/data.json")
    
    do {
        let jsonData = try Data(contentsOf: forcastDataURL)
        surfSpots = try JSONDecoder().decode(SurfSpots.self, from: jsonData)
    }
    catch {
        print("Error: \(error)")
    }
    
    return surfSpots
}

func GetGradeColor(grade: String) -> Int {
    switch grade {
    case "FLAT":
        return 0xF44A6D
    case "VERY POOR":
        return 0xF44A6D
    case "POOR":
        return 0xFF9500
    case "POOR TO FAIR":
        return 0xFFCD1D
    case "FAIR":
        return 0x0AD674
    case "FAIR TO GOOD":
        return 0x009371
    case "GOOD":
        return 0x6851F4
    case "EPIC":
        return 0x641EC8
    default:
        return 0x0AD674
    }
}

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
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ForcastEntry) -> ()) {
        completion(placeholderEntry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ForcastEntry>) -> Void) {
        let currentDate = Date()
        var entries: [ForcastEntry] = []
        
        for minuteOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = ForcastEntry(date: entryDate, spots: ParseSurfSpotJSON()!.surfSpots)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
}

struct ForcastEntry: TimelineEntry {
    let date: Date
    let spots: [Spot]
}

struct MacOsWidgetEntryView : View {
    var entry: ForcastProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            if (entry.spots.count > 0) {
                ForEach(entry.spots, id: \.self.name) { spot in
                    SurfSpotElement(spotInfo: spot)
                }
            } else {
                NoSurfSpotElement()
            }
        }
        .padding(.all, 10.0)
        .containerBackground(for: .widget) {
            Color(hex: 0xffffff, opacity: 0.8)
        }
    }
}

struct SurfSpotElement: View {
    let spotInfo: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(spotInfo.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack(alignment: .top) {
                Capsule()
                    .fill(Color(hex: GetGradeColor(grade: spotInfo.grade)))
                    .frame(maxWidth: 5, maxHeight: 55)
                HStack(alignment: .top, spacing: 50.0) {
                    VStack(alignment: .leading) {
                        Text(spotInfo.sizeHumanReadable)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0x424242))
                        HStack(alignment: .firstTextBaseline) {
                            Text(spotInfo.sizeFt)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("ft")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        Text(spotInfo.grade)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: GetGradeColor(grade: spotInfo.grade)))
                    }
                    VStack(alignment: .leading) {
                        Text(spotInfo.windDir)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0x424242))
                        HStack(alignment: .firstTextBaseline) {
                            Text(spotInfo.windSpeed)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("kts")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .padding(.horizontal, 1.0)
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}

struct NoSurfSpotElement: View {
    var body: some View {
        HStack(alignment: .top) {
            Capsule()
                .fill(Color(hex: 0xFF0000))
                .frame(maxWidth: 5)
            Text("No surf spot info...")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

struct MacOsWidget: Widget {
    let kind: String = "Surf-Forcast-MacOs-Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: ForcastProvider(),
            content: { MacOsWidgetEntryView(entry: $0) }
        )
        .configurationDisplayName("Surf Forcast")
        .description("Displays your local surf spots forcast")
        .supportedFamilies([.systemLarge])
    }
}
