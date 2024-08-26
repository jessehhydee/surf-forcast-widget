//
//  macOs_widget.swift
//  macOs-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct macOs_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            VStack(alignment: .leading) {
                Text("Taylors Mistake Surf Report")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(alignment: .top) {
                    Capsule()
                        .fill(Color(hex: 0xFFCD1D))
                        .frame(maxWidth: 7)
                    HStack(alignment: .top, spacing: 70.0) {
                        VStack(alignment: .leading) {
                            Text("Thigh to waist")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("1-2")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("ft")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            Text("POOR TO FAIR")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0xFFCD1D))
                                .padding(.top, 0.1)
                        }
                        VStack(alignment: .leading) {
                            Text("Offshore wind")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("13")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("kts")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding(.horizontal, 1.0)
            }
            .padding(.all, 15.0)
            .padding(.trailing, 30)
            .frame(alignment: .topLeading)
            .background(Color(hex: 0xffffff, opacity: 0.8))
            .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("Taylors Surf Report")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(alignment: .top) {
                    Capsule()
                        .fill(Color(hex: 0x0AD674))
                        .frame(maxWidth: 7)
                    HStack(alignment: .top, spacing: 70.0) {
                        VStack(alignment: .leading) {
                            Text("Thigh to waist")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("1-2")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("ft")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            Text("POOR TO FAIR")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x0AD674))
                                .padding(.top, 0.1)
                        }
                        VStack(alignment: .leading) {
                            Text("Offshore wind")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("13")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("kts")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding(.horizontal, 1.0)
            }
            .padding(.all, 15.0)
            .padding(.trailing, 30)
            .frame(alignment: .topLeading)
            .background(Color(hex: 0xffffff, opacity: 0.8))
            .cornerRadius(10)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
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

struct macOs_widget: Widget {
    let kind: String = "macOs_widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            macOs_widgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}
